class Danhmuc < ApplicationRecord

    def self.detailCategory(idcategory)
        @category = Danhmuc.find(idcategory)
    end

end
