<?php

namespace api\modules\v1\controllers;

use yii\base\NotSupportedException;
use yii\rest\ActiveController;
use api\modules\v1\models\Book;
use api\modules\v1\models\Author;
use yii\web\HttpException;


class BookController extends ActiveController
{
    public $modelClass = 'api\modules\v1\models\Book';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);

        return $actions;
    }

    public function actionIndex()
    {
        $books = Book::find()
            ->all();

        foreach ($books as $book) {
            $book->__set('author',$book->__get('author')->first_name . ' ' . $book->__get('author')->last_name);
            $book->__set('edition',$book->__get('edition')->name);
            $books[] = $book;
        }

        if ( !empty($books) ) {
            return $books;
        } else {
            return \Yii::$app->response->setStatusCode(404, 'Data not found');
        }
    }

    public function actionBooks($id)
    {
        $books = Book::find()
            ->where(['author_id' => intval($id)])
            ->all();

        foreach ($books as $book) {
            $book->__set('author',$book->__get('author')->first_name . ' ' . $book->__get('author')->last_name);
            $book->__set('edition',$book->__get('edition')->name);
            $books[] = $book;
        }

        if ( !empty($books) ) {
            return $books;
        } else {
            return \Yii::$app->response->setStatusCode(404, 'Data not found');
        }
    }

    public function actionAddBook() {
        $request = \Yii::$app->request;
        $data = $request->post();
        $model = new Book();

        $model->issue_year = $data['issue_year'];
        $model->name = $data['name'];
        $model->author_id = $data['author_id'];
        $model->edition_id = $data['edition_id'];

        return $model->save();
    }

    public function actionEditBook($id) {
        $model = Book::find()
            ->where(['id' => intval($id)])
            ->one();
        $request = \Yii::$app->request;
        $data = $request->post();
        $author_id = intval($data['author_id']);

        $model->author_id = $author_id;

        return $model->save();
    }

    public function actionDeleteAuthor($id) {
        $modelBooks = Book::find()
            ->where(['author_id' => intval($id)])
            ->all();

        if ( !empty($modelBooks) ) {
            foreach ($modelBooks as $workorderpopup) {
                $workorderpopup->delete();
            }
        }

        $model = Author::find()
            ->where(['id' => intval($id)])
            ->one();

        if ( !empty($model) ) {
            return $model->delete();
        } else {
            return \Yii::$app->response->setStatusCode(404, 'Data not found');
        }
    }
}


