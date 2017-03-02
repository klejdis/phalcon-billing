<?php

namespace Vokuro\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;




class CustomersForm extends Form
{

    public function initialize($entity = null, $options = null)
    {

        // In edition the id is hidden
        if (isset($options['edit']) && $options['edit']) {
            $id = new Hidden('id');
        } else {
            $id = new Text('id');
        }

        $this->add($id);

        //Gender Select
        $this->add(new Select('gender', ['z' => 'Z.' , 'znj' => 'Znj'] ) );

        $name = new Text('name', [
            'placeholder' => 'Name'
        ]);

        //Name Input
        $name->addValidators([
            new PresenceOf([
                'message' => 'The name is required'
            ])
        ]);
        $this->add($name);

        //Surname Input
        $surname = new Text('surname', [
            'placeholder' => 'Surname'
        ]);
        $this->add($surname);

        //Email Input
        $email = new Text('email', [
            'placeholder' => 'Email'
        ]);
        $this->add($email);

        //Juridiction Select
        $this->add(new Select('juridiction', ['rezident' => 'Rezident' , 'business' => 'Business'] ));
        
        //Phone Input
        $phone = new Text('phone', [
            'placeholder' => 'Phone'
        ]);
        $this->add($phone);

        //contractStatus Select
        $this->add(new Select('contractStatus', ['1' => 'Active' , '0' => 'Non Active'] ));  

        //Address Textarea
        $address = new TextArea('address', [
            'placeholder' => 'Address'
        ]);
        $this->add($address);

   
    }
}
