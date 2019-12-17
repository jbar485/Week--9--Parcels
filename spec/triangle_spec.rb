require 'rspec'
require 'parcel'

describe '#Parcel' do

  before(:each) do
    Parcel.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no parcels") do
      expect(Parcel.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves package dimensions") do
      parcel1 = Parcel.new("Judah", 5, 5, 25, nil)
      parcel1.save
      parcel2 = Parcel.new("Josh", 8, 5, 95, nil)
      parcel2.save
      expect(Parcel.all).to(eq([parcel1, parcel2]))
    end
  end

  describe('#==') do
    it("is the same parcel if it has the same attributes as another parcel") do
      parcel = Parcel.new("Judah", 5, 5, 25, nil)
      parcel2 = Parcel.new("Judah", 5, 5, 25, nil)
      expect(parcel).to(eq(parcel2))
    end
  end

  describe('.clear') do
    it("clears all parcels") do
      parcel = Parcel.new("Judah", 5, 5, 25, nil)
      parcel.save()
      parcel2 = Parcel.new("Josh", 8, 5, 95, nil)
      parcel2.save()
      Parcel.clear()
      expect(Parcel.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an parcel by id") do
      parcel = Parcel.new("Judah", 5, 5, 25, nil)
      parcel.save()
      parcel2 = Parcel.new("Josh", 8, 5, 95, nil)
      parcel2.save()
      expect(Parcel.find(parcel.id)).to(eq(parcel))
    end
  end

  describe('#update') do
    it("updates an parcel by id") do
      parcel = Parcel.new("Judah", 5, 5, 25, nil)
      parcel.save()
      parcel.update("A Love")
      expect(parcel.name).to(eq("A Love"))
    end
  end

  describe('#delete') do
    it("deletes an parcel by id") do
      parcel = Parcel.new("Judah", 5, 5, 25, nil)
      parcel.save()
      parcel2 = Parcel.new("Josh", 8, 5, 95, nil)
      parcel2.save()
      parcel.delete()
      expect(Parcel.all).to(eq([parcel2]))
    end
  end
end
