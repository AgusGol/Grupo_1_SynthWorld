
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
        created_at: dataTypes.TIMESTAMP,

        updated_at: dataTypes.TIMESTAMP
        
    }
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
            foreignKey: "product_id",
            otherKey: "order_id",
           // onDelete: 'CASCADE',
          //  hooks: true
            })
 }
    return Order;
};