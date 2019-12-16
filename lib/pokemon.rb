class Pokemon
  class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(name:, type:, db:, id:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)', name, type)
    SQL
    DB.execute(sql,name, type)
  end

  def self.find(id, db)
    pokemon = db.execute('SELECT * FROM POKEMON WHERE ID = ?', id)
    Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db)
  end

end
end
