<?php

namespace Vokuro\Controllers;

use Vokuro\Models\Customers; 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Tag;
use Vokuro\Forms\CustomersForm;


class CustomersController extends ControllerBase
{


    public function initialize(){
        $this->view->setTemplateBefore('collapsed-sidebar');
       
    }

    /**
     * Index action
     */
    public function indexAction()
    {   
        //client search is the default page
        $this->persistent->parameters = null;
    }

    /**
     * Searches for customers
     */
    public function searchAction()
    {
        
        $numberPage = 1;

        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Vokuro\Models\Customers', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $this->persistent->parameters = null;
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
            if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $customers = Customers::find($parameters);
        if (count($customers) == 0) {
            $this->flash->notice("The search did not find any customers");

            $this->dispatcher->forward([
                "controller" => "customers",
                "action" => "index",
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $customers,
            'limit'=> 10,
            'page' => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
    }


    /**
     * Edits a customer
     *
     * @param string $id
     */
    public function editAction($id)
    {
     

        $customer = Customers::findFirstByid($id);

        if (!$customer) {
            $this->flash->error("customer was not found");
            $this->dispatcher->forward([
                'action' => 'index'
            ]);
            return;
        }
  
        if ($this->request->isPost()) {
            
            $customer->name = $this->request->getPost("name");
            $customer->surname = $this->request->getPost("surname") ;
            $customer->email =  $this->request->getPost("email","email");
            $customer->gender = $this->request->getPost("gender");
            $customer->juridiction = $this->request->getPost("juridiction") ;
            $customer->phone = $this->request->getPost("phone");
            $customer->contractStatus = $this->request->getPost("contractStatus") ;
            $customer->address = $this->request->getPost("address");

            $form = new CustomersForm($customer , ['edit' => true]);

            if ($form->isValid($this->request->getPost()) == false) {
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }   
            }else{
                if (!$customer->save()) {
                    $this->flash->error($customer->getMessages());
                }else{
                    $this->flash->success("Customer edited successfully");
                    Tag::resetInput();


                }
            }  
                  
        }
         $this->view->customer = $customer;
         $form = new CustomersForm($customer , ['edit' => true]);
         $this->view->form = $form;
    }

    /**
     * Creates a new customer
     * The Create Customer Form is POSTED Here
     */
    public function createAction()
    {

        $form = new CustomersForm(null);

        if ($this->request->isPost()) {

             if ($form->isValid($this->request->getPost()) == false) {

                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
                
            }else{

                $customer = new Customers();
                $customer->name = $this->request->getPost("name");
                $customer->surname = $this->request->getPost("surname") ;
                $customer->email =  $this->request->getPost("email","email");
                $customer->gender = $this->request->getPost("gender");
                $customer->juridiction = $this->request->getPost("juridiction") ;
                $customer->phone = $this->request->getPost("phone");
                $customer->contractStatus = $this->request->getPost("contractStatus") ;
                $customer->address = $this->request->getPost("address");

                if (!$customer->save()) {
                    foreach ($customer->getMessages() as $message) {
                        $this->flash->error($message);
                    }

                }else{

                    $this->flash->success("customer was created successfully");

                    $this->dispatcher->forward([
                        'controller' => "customers",
                        'action' => 'search',
                       // 'params' => [$customer->id]
                    ]);


                }


            }//end else
           
        }//endif

         $this->view->form = $form;

    }

    /**
     * Saves a customer edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "customers",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $customer = Customers::findFirstByid($id);

        if (!$customer) {
            $this->flash->error("customer does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "customers",
                'action' => 'index'
            ]);

            return;
        }


        $customer->name = $this->request->getPost("name");
        $customer->surname = $this->request->getPost("surname") ;
        $customer->email =  $this->request->getPost("email", "email");
        $customer->gender = $this->request->getPost("gender");
        $customer->juridiction = $this->request->getPost("juridiction");
        $customer->phone = $this->request->getPost("phone");
        $customer->contractStatus = $this->request->getPost("contractStatus") ;
        $customer->service = $this->request->getPost("service") ;
        $customer->address = $this->request->getPost("address");
        

        if (!$customer->save()) {

            foreach ($customer->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "customers",
                'action' => 'edit',
                'params' => [$customer->id]
            ]);

            return;
        }

        $this->flash->success("customer was updated successfully");

        $this->response->redirect('customers/search');
    }

    /**
     * Deletes a customer
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $customer = Customers::findFirstByid($id);
        if (!$customer) {
            $this->flash->error("customer was not found");

            $this->dispatcher->forward([
                'controller' => "customers",
                'action' => 'index'
            ]);

            return;
        }

        if (!$customer->delete()) {

            foreach ($customer->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "customers",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("customer was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "customers",
            'action' => "search"
        ]);
    }

}
