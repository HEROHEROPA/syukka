class Config < ActiveHash::Base
  self.data = [
    { id: 1, item_number: 'pod-r',item_image:"" ,item_amount:1},
    { id: 2, item_number: 'pod-l',item_image:"",item_amount:1 },
    { id: 3, item_number: 'pods',item_image:"",attach:{r:{item_number: 'pod-r',item_image:"" ,item_amount:1,stock_id:1},l:{item_number: 'pod-l',item_image:"",item_amount:1,stock_id:2}}}
  ]

  include ActiveHash::Associations
  belongs_to :order
  belongs_to :shipping
end