module Customer::CustomersHelper
  def full_name(customer)
    "#{customer.surname} #{customer.firstname}"
  end
  
  def kana_full_name(customer)
    "#{customer.surname_kana} #{customer.firstname_kana}" 
  end
end
