<?php

namespace api\modules\v1\models;
use \yii\db\ActiveRecord;


class Edition extends ActiveRecord
{
    public static function tableName()
    {
        return 'editions';
    }

    public static function primaryKey()
    {
        return ['id'];
    }

    public function rules()
    {
        return [
            [['id', 'name'], 'required'],
        ];
    }
}