class User < ActiveRecord::Base
  acts_as_authentic
  
  named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }

  ROLES = %w[admin client]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role_symbols
    roles.map(&:to_sym)
  end
  
  def has_role?(role)
    roles.include?(role.to_s)
  end
end
