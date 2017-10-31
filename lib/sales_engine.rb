require 'csv'
require './lib/item_repository'
require './lib/merchant_repository'

class SalesEngine
  attr_reader :item_repository, :merchant_repository

  def initialize(item_repository, merchant_repository)
    @item_repository = item_repository
    @merchant_repository = merchant_repository
  end

  def self.from_csv(files)
    item_repository = ItemRepository.new(load_csv(files[:items]))
    merchant_repository = MerchantRepository.new(load_csv(files[:merchants]))
    SalesEngine.new(item_repository, merchant_repository)
  end

  def self.load_csv(file_name)
    contents = CSV.open(file_name, headers: true, header_converters: :symbol)
    contents.map do |row|
      row
    end
  end
end