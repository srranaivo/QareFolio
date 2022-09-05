class AddDoneToValidatedCares < ActiveRecord::Migration[7.0]
  def change
    add_column :validated_cares, :done, :boolean, default: false
  end
end
