class ChangeOfferCostDuration < ActiveRecord::Migration[5.2]
  def change
    rename_column :offers, :cost, :oldcost
    rename_column :offers, :duration, :oldduration
    add_column :offers, :cost, :string
    add_column :offers, :duration, :string
  end
end
