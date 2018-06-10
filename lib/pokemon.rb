require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    pokemon[:hp] ? @hp = pokemon[:hp] : @hp = nil
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) values (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("select * from pokemon where id = #{id}").flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp: pokemon[3])
  end

  def alter_hp(hp, db)
    db.execute("update pokemon set hp = ? where id = ?", hp, self.id)

  end
end
