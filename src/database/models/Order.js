
module.exports = (sequelize, dataTypes) => {
    let alias = 'Order';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        user_id: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        total: {
            type: dataTypes.DECIMAL(10,2),
            allowNull: false
        },
        checkout: {
            type: dataTypes.TINYINT,
            defaultValue: 0
        },
        checkout_date: {
            type: dataTypes.DATE,
            allowNull: true
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
    const Order = sequelize.define(alias, cols, config); 

    
     Order.associate = function(models){
        
        Order.belongsTo(models.User, {
            as: "user",
            foreignKey: "user_id",
           // onDelete: 'CASCADE',
          //  hooks: true
            })
        Order.belongsToMany(models.Product, {
            as: "product",
            through: "cart_products",
            foreignKey: "order_id" ,
            otherKey: "product_id",
           // onDelete: 'CASCADE',
          //  hooks: true
            })
        Order.hasMany(models.CartProduct, {
            as: "CartProduct",
            foreignKey: "order_id",
            })
 }
    return Order;
};