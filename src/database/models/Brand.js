
module.exports = (sequelize, dataTypes) => {
    let alias = 'Brand';
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
    const Brand = sequelize.define(alias, cols, config); 

    
 Brand.associate = function(models){
    
     Brand.hasMany(models.Product, {
         as: "product",
         foreignKey: "brand_id",
         timestamps: false,
        // onDelete: 'CASCADE',
       //  hooks: true
     })
 }
    return Brand;
};
