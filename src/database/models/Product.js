
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
            type: dataTypes.STRING(100),
            allowNull: false
        },
        brand_id: {
            type: dataTypes.INTEGER,
            allowNull: true
        },
        // category_id: {
        //     type: dataTypes.INTEGER,
        //     allowNull: false
        // },
        price: {
            type: dataTypes.DECIMAL(10, 2),
            allowNull: false
        },
        discount: {
            type: dataTypes.DECIMAL(4, 2),
            defaultValue: 0
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
        is_active: {
            type: dataTypes.TINYINT,
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
    const Product = sequelize.define(alias, cols, config); 

    
     Product.associate = function(models){

        Product.belongsTo(models.Brand, {
            as: "brand",
            foreignKey: "brand_id",
            // onDelete: 'CASCADE',
        //  hooks: true
        })

        Product.belongsToMany(models.Category, {
            as: "category",
            through: "product_category",
            foreignKey: "category_id",
            otherKey: "product_id",
            // onDelete: 'CASCADE',
        //  hooks: true
        })

        Product.belongsToMany(models.Order, {
            as: "order",
            through: "cart_products",
            foreignKey: "product_id",
            otherKey: "order_id",
           // onDelete: 'CASCADE',
          //  hooks: true
            })
        Product.hasMany(models.CartProduct, {
            as: "CartProduct",
            foreignKey: "product_id",
        })
    
     }
    return Product
};
