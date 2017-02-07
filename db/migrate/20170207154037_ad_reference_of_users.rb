class AdReferenceOfUsers < ActiveRecord::Migration[5.0]
  def change
    #if the user change his name it will change in gigs and proposals as well
    add_reference :gigs, :user, index: true
    add_reference :proposals, :user, index: true
  end
end
