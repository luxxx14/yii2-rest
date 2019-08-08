<?php
namespace api\modules\v1\models;
use \yii\db\ActiveRecord;
use api\modules\v1\models\Author;
use api\modules\v1\models\Edition;

class Book extends ActiveRecord
{
    public $author;
    public $edition;


	public static function tableName()
	{
		return 'books';
	}

    public static function primaryKey()
    {
        return ['id'];
    }

    public function getAuthor()
    {
        return $this->hasOne(Author::className(), ['id' => 'author_id']);
    }

    public function getEdition()
    {
        return $this->hasOne(Edition::className(), ['id' => 'edition_id']);
    }

    public function setAuthor($value)
    {
        $this->author = $value;
    }

    public function setEdition($value)
    {
        $this->edition = $value;
    }

    public function fields()
    {
        $fields = parent::fields();
        $fields[] = 'author';
        $fields[] = 'edition';

        return $fields;
   }

    public function rules()
    {
        return [
            [['author', 'edition'], 'safe'],
            [['name', 'issue_year', 'author_id', 'edition_id'], 'required'],
        ];
    }

}
