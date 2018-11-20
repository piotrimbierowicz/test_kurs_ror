class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dragons
  has_many :resources
  has_many :expeditions

  def can_afford?(dragon_type)
    resources_list = dragon_type.resources_amount
    resources_list.each do |resource|
      user_amount = resources.find_by(resource_type: resource.resource_type.id)
      return false if user_amount.nil? || !good_amount?(user_amount, resource)
    end
    true
  end

  def missing_resources_for(dragon_type)
    missing_resources = []
    dragon_type.resources_amount.each do |resource|
      user_amount = resources.find_by(resource_type: resource.resource_type.id)
      if user_amount.nil?
        missing_resources << { resource: resource, quantity: resource.cost }
      elsif !good_amount?(user_amount, resource)
        missing_resources << { resource: resource, quantity: resource.cost - user_amount.quantity }
      end
    end
    missing_resources
  end

  def missing_resources_for_error(dragon_type)
    missing_resources = 'Lacking resources: '
    missing_resources_for(dragon_type).map do |missing_resource|
      missing_resources += "#{missing_resource[:quantity]} #{missing_resource[:resource].resource_type.name} "
    end
    missing_resources
  end

  def good_amount?(user_amount, resource)
    user_amount.quantity - resource.cost >= 0
  end
end
