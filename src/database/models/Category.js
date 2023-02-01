
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
    const Category = sequelize.define(alias, cols, config); 

    
     Category.associate = function(models){

        Category.belongsToMany(models.Product, {
            as: "product",
            through: "product_category",
            foreignKey: "category_id",
            otherKey: "product_id",
            // onDelete: 'CASCADE',
        //  hooks: true
        })
 }
    return Category;
};