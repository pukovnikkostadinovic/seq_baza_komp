
module.exports = function(sequelize, DataTypes) {
  
var Kategorija = sequelize.define("kategorije", {
    ime_kategorije: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: false

	
    },
    kratak_opis: {
      type: DataTypes.STRING(400),
      allowNull: true,
      unique: false,

    }
	
  },
{

freezeTableName:true,
timestamps:false,
charset:'cp1250',
collate:'cp1250_croatian_ci'
});	

var Komponenta = sequelize.define("komponente", {
    ime_komponente: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: false	
    },

    kratak_opis_komp: {
      type: DataTypes.STRING(400),
      allowNull: true,
      unique: false,
    },
      slika: {
      type: DataTypes.STRING,
      allowNull: true,
      unique: false,
    }

  },{

freezeTableName:true,
timestamps:false,
charset:'cp1250',
collate:'cp1250_croatian_ci'

});

var Lokacija = sequelize.define("lokacije", {
    ime_lokacije: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: false
    }
},
{
freezeTableName:true,
timestamps:false,
charset:'cp1250',
collate:'cp1250_croatian_ci'
});	

var KompLokKol = sequelize.define("komp_lok_kol", {
      kolicina: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue:0
    }

  },

{

freezeTableName:true,
timestamps:false

});
	Kategorija.hasMany(Komponenta,{foreignKey:'kateg_id'});
	Komponenta.belongsTo(Kategorija,{foreignKey:'kateg_id'});
	Komponenta.hasMany(KompLokKol,{foreignKey:'komp_id'});
	KompLokKol.belongsTo(Komponenta,{foreignKey:'komp_id'});
	Lokacija.hasMany(KompLokKol,{foreignKey:'lok_id'});
	KompLokKol.belongsTo(Lokacija,{foreignKey:'lok_id'});

  return  Kategorija, Komponenta, Lokacija, KompLokKol;
};
