
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

        created_at: dataTypes.TIMESTAMP,
        
    };
    let config = {
        
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: false,
        deletedAt: false
    }
    const CartProduct = sequelize.define(alias, cols, config); 

    
    CartProduct.associate = function(models){
        
        CartProduct.belongsTo(models.Order, {
            as: "user",
            foreignKey: "user_id",
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