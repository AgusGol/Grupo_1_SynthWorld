
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
    const Brand = sequelize.define(alias, cols, config); 

    
 Brand.associate = function(models){

     Brand.hasMany(models.Product, {
         as: "product",
         foreignKey: "brand_id",
        // onDelete: 'CASCADE',
       //  hooks: true
     })
 }
    return Brand;
};
