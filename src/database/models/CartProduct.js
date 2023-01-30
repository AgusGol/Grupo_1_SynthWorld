
module.exports = (sequelize, dataTypes) => {
    let alias = 'CartProduct';
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
        order_id: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        quantity: {
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
        tableName: "cart_products",
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: 'updated_at',
        deletedAt: false
    }
    const CartProduct = sequelize.define(alias, cols, config); 

    
    CartProduct.associate = function(models){
        
        CartProduct.belongsTo(models.Order, {
            as: "order",
            foreignKey: "order_id",
           // onDelete: 'CASCADE',
          //  hooks: true
            })
        CartProduct.belongsTo(models.Product, {
            as: "product",
            foreignKey: "product_id",
           // onDelete: 'CASCADE',
          //  hooks: true
            })
 }
    return CartProduct;
};