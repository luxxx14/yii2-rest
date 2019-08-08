<?php

namespace api\modules\v1\models;
use \yii\db\ActiveRecord;
use api\modules\v1\models\Book;


class Author extends ActiveRecord
{
    public $books = [];

    public static function tableName()
    {
        return 'authors';
    }

    public static function primaryKey()
    {
        return ['id'];
    }

    public function rules()
    {
        return [
            [['books'], 'safe'],
            [['first_name', 'last_name', 'birth_year', 'country_id'], 'required'],
        ];
    }

    public function getBooks()
    {
        return $this->hasMany(Book::className(), ['author_id' => 'id']);
    }

    public function setBooks($value)
    {
        $this->books = $value;
    }

}