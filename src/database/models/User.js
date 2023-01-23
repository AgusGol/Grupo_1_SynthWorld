
module.exports = (sequelize, dataTypes) => {
    let alias = 'User';
    let cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
            allowNull: false
        },
        first_name: {
            type: dataTypes.STRING(45),
            allowNull: false
        },
        last_name: {
            type: dataTypes.STRING(45),
            allowNull: true
        },
        email: {
            type: dataTypes.STRING(100),
            allowNull: false
        },
        password: {
            type: dataTypes.STRING(100),
            allowNull: false
        },
        image: {
            type: dataTypes.STRING(100),
            allowNull: true
        },
        is_admin: {
            type: dataTypes.TINYINT(1),
            allowNull: false
        },
        created_at: dataTypes.TIMESTAMP,

        // updated_at: dataTypes.TIMESTAMP, esta no es necesaria en users
    };
    let config = {
        
        timestamps: true,
        createdAt: 'created_at',
        updatedAt: false,
        deletedAt: false
    }
    const User = sequelize.define(alias, cols, config); 

    
 User.associate = function(models){

     User.hasMany(models.Order, {
         as: "order",
         foreignKey: "user_id",
        // onDelete: 'CASCADE',
       //  hooks: true
         })
     }
    return User
};
