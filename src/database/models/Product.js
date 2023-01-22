
module.exports = (sequelize, dataTypes) => {
    let alias = 'Product';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        name: {
            type: dataTypes.STRING(45),
            allowNull: false
        },
        brand_id: {
            type: dataTypes.INTEGER,
            allowNull: true
        },
        category_id: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        price: {
            type: dataTypes.DECIMAL(10, 2),
            allowNull: false
        },
        discount: {
            type: dataTypes.DECIMAL(4, 2),
            allowNull: true
        },
        image: {
            type: dataTypes.STRING(100),
            allowNull: false
        },
        description: {
            type: dataTypes.TEXT,
            allowNull: true
        },
        extra_info: {
            type: dataTypes.TEXT,
            allowNull: true
        },
        availability: {
            type: dataTypes.BINARY(1),
            allowNull: false
        },
        created_at: dataTypes.TIMESTAMP,

        updated_at: dataTypes.TIMESTAMP
    };
    let config = {
        
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: false,
        deletedAt: false
    }
    const Product = sequelize.define(alias, cols, config); 

    
     Product.associate = function(models){

        Product.belongsTo(models.Brand, {
            as: "brand",
            foreignKey: "brand_id",
            // onDelete: 'CASCADE',
        //  hooks: true
        })

        Product.belongsTo(models.Category, {
            as: "category",
            foreignKey: "category_id",
            // onDelete: 'CASCADE',
        //  hooks: true
        })

        Product.hasMany(models.Cart, {
            as: "product",
            foreignKey: "product_id",
            timestamps: false,
            // onDelete: 'CASCADE',
        //  hooks: true
        })
    
     }
    return User
};
