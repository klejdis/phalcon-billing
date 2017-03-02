<?php
namespace Vokuro\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;


class PaymentsForm extends Form
{

    public function initialize($entity = null, $options = null)
    {


         if (isset($options) && $options['edit'] == true) {

            $id = new Hidden('id');
            $this->add($id);

         }

        $cid = new Hidden('customerId');
        $cid->addValidators([
            new PresenceOf([
                'message' => 'Please Select a Customer'
            ])
        ]);

        $this->add($cid);

        if (isset($options) && $options['edit'] == true) {
             $name = new Text('customerName' , ['value' => $entity->customer->name .' '. $entity->customer->surname ]);
             $this->add($name);
       
        }else{

            $name = new Text('customerName');
            $this->add($name);
        }
       


        $amount = new Text('amount');

        $amount->addValidators([
            new PresenceOf([
                'message' => 'Please Add an Amount'
            ])
        ]);
        $this->add($amount);


        $date = new Text('date');
        $date->addValidators([
            new PresenceOf([
                'message' => 'Please Select a Date'
            ])
        ]);
        $this->add($date);


        


    }
}
