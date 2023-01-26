
module.exports = (sequelize, dataTypes) => {
    let alias = 'Category';
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
        created_at: {
            type: dataTypes.DATE,
            default: DATE.NOW()
        },

        updated_at: {
            type: dataTypes.DATE,
            default: DATE.NOW()
        }
        
    };
    let config = {
        
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: 'updated_at',
        deletedAt: false
    }
    const Category = sequelize.define(alias, cols, config); 

    
     Category.associate = function(models){

        Category.belongsToMany(models.Product, {
            as: "product",
            through: "product_category",
            foreignKey: "product_id",
            otherKey: "category_id",
            // onDelete: 'CASCADE',
        //  hooks: true
        })
 }
    return Category;
};