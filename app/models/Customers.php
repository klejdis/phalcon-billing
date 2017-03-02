<?php
namespace Vokuro\Models;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Db\RawValue;

class Customers extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $surname;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $gender;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $juridiction;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $phone;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=true)
     */
    public $contractStatus;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $address;


    public function beforeValidation()
    {   
        // TO ALLOW EMPTY VALUE ON FORM
        if ($this->email === '') {
            $this->email = new RawValue('');
        }

         if ($this->surname === '') {
            $this->surname = new RawValue('');
        }
        
        if ($this->gender === '') {
            $this->gender = new RawValue('');
        }
        


        if ($this->juridiction === '') {
            $this->juridiction = new RawValue('');
        }


        if ($this->phone === '') {
            $this->phone = new RawValue('');
        }

        if ($this->contractStatus === '') {
            $this->contractStatus = 0;
        }

        if ($this->address === '') {
            $this->address = new RawValue('');
        }

    }

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $validator = new Validation();

        // $validator->add(
        //     'email',
        //     new EmailValidator(
        //         [
        //             'model'   => $this,
        //             'message' => 'Please enter a correct email address',
        //         ]
        //     )
        // );

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("vokuro");
        
        $this->hasMany(
            "id",
             __NAMESPACE__ ."\Payments",
            "customerId",
            [
            'alias' => 'payments',
            'foreignKey' => [
                'message' => 'Customer cannot be deleted because it\'s used on Payments'
                ]
            ]
            );

    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'customers';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Customers[]|Customers
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Customers
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
