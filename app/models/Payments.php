<?php
namespace Vokuro\Models;

use Phalcon\Mvc\Model;

class Payments extends Model
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
     * @Column(type="string", nullable=false)
     */
    public $date;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $amount;


    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $customer_id;
    

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("vokuro");

        $this->belongsTo(

            "customerId",
             __NAMESPACE__ ."\Customers",
            "id",
            [
            'alias' => 'customer',
            'reusable' => true
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
        return 'payments';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Payments[]|Payments
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Payments
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
