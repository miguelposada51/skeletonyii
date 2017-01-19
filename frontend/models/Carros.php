<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "carros".
 *
 * @property integer $id
 * @property string $modelo
 * @property string $serie
 * @property string $placa
 * @property string $color
 * @property integer $id_empresa
 */
class Carros extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'carros';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['modelo', 'serie', 'placa', 'color', 'id_empresa'], 'required'],
            [['id_empresa'], 'integer'],
            [['modelo', 'serie'], 'string', 'max' => 30],
            [['placa', 'color'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'modelo' => 'Modelo',
            'serie' => 'Serie',
            'placa' => 'Placa',
            'color' => 'Color',
            'id_empresa' => 'Id Empresa',
        ];
    }
}
