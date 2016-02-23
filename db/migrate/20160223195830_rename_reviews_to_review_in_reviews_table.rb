class RenameReviewsToReviewInReviewsTable < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.rename :reviews, :review
    end
  end
end
