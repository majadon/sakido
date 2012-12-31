namespace :ragnarok do

require 'open-uri'
  
UPSTREAM_URL = "http://rathena.googlecode.com/svn/trunk"
  
UPSTREAM_STRUCTURE_CHARACTER = "JobID,Weight,HPFactor,HPMultiplicator,SPFactor,Unarmed,Dagger,oneh_Sword,twoh_Sword,oneh_Spear,twoh_Spear,oneh_Axe,twoh_Axe,oneh_Mace,twoh_Mace_unused,Rod,Bow,Knuckle,Instrument,Whip,Book,Katar,Revolver,Rifle,Gatling_Gun,Shotgun,Grenade_Launcher,Fuuma_Shuriken,twoh_Staff,Shield"
UPSTREAM_STRUCTURE_MONSTER = "MobID,Sprite_Name,kROName,iROName,LV,HP,SP,EXP,JEXP,Range1,ATK1,ATK2,DEF,MDEF,STR,AGI,VIT,INT,DEX,LUK,Range2,Range3,Scale,Race,Element,Mode,Speed,aDelay,aMotion,dMotion,MEXP,MVP1id,MVP1per,MVP2id,MVP2per,MVP3id,MVP3per,Drop1id,Drop1per,Drop2id,Drop2per,Drop3id,Drop3per,Drop4id,Drop4per,Drop5id,Drop5per,Drop6id,Drop6per,Drop7id,Drop7per,Drop8id,Drop8per,Drop9id,Drop9per,DropCardid,DropCardper"
UPSTREAM_STRUCTURE_ITEM = "ItemID,AegisName,Name,ModelType,Buy,Sell,Weight,ATK,DEF,Range,Slots,Job,Upper,Gender,Loc,wLV,eLV,Refineable,View,{ Script },{ OnEquip_Script },{ OnUnequip_Script }"


  
desc "Updates Characters"  
task :ro_characters => [:ro_characters_base] do 
   puts "All character related tasks have been run."
end

desc "Updates Monsters"
task :ro_monsters => [:ro_monsters_base] do 
  puts "All monster related tasks have been run."
end

desc "Updates Items"
task :ro_items => [:ro_items_base] do 
  puts "All item related tasks have been run."
end

  
desc "Updates basic information about characters"  
task :ro_characters_base => :environment do
  next unless upstream = load_db_file(UPSTREAM_URL+"/db/re/job_db1.txt", :structure => UPSTREAM_STRUCTURE_CHARACTER)
  parse_db_file(upstream, :structure => UPSTREAM_STRUCTURE_CHARACTER) do |params|
    char = Character.where(:jobID => params[:jobID]).first_or_create
    unless char.update_attributes(params, :without_protection => true)
      puts "Warning: Cannot save character ##{character.id} (Ragnarok##{character.jobID}"
    end
  end
end

desc "Updates basic information about monsters"
task :ro_monsters_base => :environment do
  next unless upstream = load_db_file(UPSTREAM_URL+"/db/re/mob_db.txt", :structure => UPSTREAM_STRUCTURE_MONSTER)
  parse_db_file(upstream, :structure => UPSTREAM_STRUCTURE_MONSTER) do |params|
    monster = Monster.where(:mobid => params[:mobid]).first_or_create
    unless monster.update_attributes(params, :without_protection => true)
      puts "Warning: Cannot save monster ##{monster.id} (Ragnarok##{monster.mobid}"
    end
  end
end

desc "Updates basic information about items"
task :ro_items_base => :environment do
  next unless upstream = load_db_file(UPSTREAM_URL+"/db/re/item_db.txt", :structure => UPSTREAM_STRUCTURE_ITEM)
  parse_db_file(upstream, :structure => UPSTREAM_STRUCTURE_ITEM) do |params|
    item = Item.where(:itemid => params[:itemid]).first_or_create
    unless item.update_attributes(params, :without_protection => true)
      puts "Warning: Cannot save item ##{item.id} (Ragnarok##{item.itemid}"
    end
  end
end



desc "Fetches data from upstream and updates all database entries"  
task :update => [:ro_characters, :ro_monsters, :ro_items] do
  puts "All tasks have been run."
end  

def load_db_file(url, opts)
  begin
    upstream = open(url).read
  rescue
    puts "Error: Cannot read #{url}: #{$!}"
    return
  end
  # we really need to confirm the structure did not change.
  unless !opts[:structure].blank? || upstream.scan(opts[:structure])
    puts "Error: Upstream structure does not match"
    return
  end    
  return upstream
end

def generate_keys(keys)
  #generate key-array
  db_keys = keys.split(",").collect{|k| k.downcase.gsub(/[}{]/, '').strip.to_sym}
  #rename some keys which would break rails functionality
  #db_keys[db_keys.find_index(:id)] = :ragnarok_id if db_keys.find_index(:id)
  #db_keys[db_keys.find_index(:type)] = :modeltype if db_keys.find_index(:type)
  return db_keys
end

def parse_db_file(data, opts, &block)
  db_keys = generate_keys(opts[:structure])
    data.split("\n").each do |line|
      next if line.match(/^(\s*(\/\/|#).*|\s*)$/i) #ignore comments or blanks
      line.strip! #move whitespaces to hell ;)
      values = line.split(",")
      params = Hash[*db_keys.zip(values).flatten]
      yield params
    end
  end
end