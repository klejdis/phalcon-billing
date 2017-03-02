<?php

namespace Vokuro\Models;


use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;

class Client extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=255, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $surname;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $gender;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $birthday;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $juridiction;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $phone;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $contractStatus;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=true)
     */
    public $address;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("vokuro");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'client';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Client[]|Client
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Client
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
