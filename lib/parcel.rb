class Parcel
  attr_reader :name, :height, :width, :weight, :id

  @@parcels = {}
  @@total_rows = 0

  def initialize(name, height, width, weight, id)
    @name = name
    @height = height
    @width = width
    @weight = weight
    @id = id || @@total_rows += 1
  end

  def self.all
    @@parcels.values()
  end

  def self.clear
    @@parcels = {}
    @total_rows = 0
  end

  def save
    @@parcels[self.id] = Parcel.new(self.name, self.height, self.width, self.weight, self.id)
  end
  def ==(parcel_to_compare)
    self.name() == parcel_to_compare.name()
    self.height() == parcel_to_compare.height()
    self.width() == parcel_to_compare.width()
    self.weight() == parcel_to_compare.weight()
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@parcels.delete(self.id)
  end

end
