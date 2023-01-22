
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
        
    };
    let config = {
        
        timestamps: false,
    }
    const Category = sequelize.define(alias, cols, config); 

    
     Category.associate = function(models){
        
        Category.hasMany(models.Product, {
            as: "product",
            foreignKey: "category_id",
            timestamps: false,
            // onDelete: 'CASCADE',
        //  hooks: true
        })
 }
    return Category;
};