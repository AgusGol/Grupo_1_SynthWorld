const { DATE } = require("sequelize");

module.exports = (sequelize, dataTypes) => {
    let alias = 'ProductCategory';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        product_id: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        category_id: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        created_at: {
            type: dataTypes.DATE,
            default: Date.now()
        },

        updated_at: {
            type: dataTypes.DATE,
            default: Date.now()
        }
        
    };
    let config = {
        
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: 'updated_at',
        deletedAt: false
    }
    const ProductCategory = sequelize.define(alias, cols, config); 

    
    ProductCategory.associate = function(models){
        
        ProductCategory.belongsTo(models.Product, {
            as: "product",
            foreignKey: "product_id",
           // onDelete: 'CASCADE',
          //  hooks: true
            })
        ProductCategory.belongsTo(models.Category, {
            as: "category",
            foreignKey: "category_id",
           // onDelete: 'CASCADE',
          //  hooks: true
            })
 }
    return ProductCategory;
};