<?php
namespace Vokuro\Controllers;

use Vokuro\Models\Payments;
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Mvc\View;
use Vokuro\Models\Customers;
use Vokuro\Forms\PaymentsForm;

class PaymentsController extends ControllerBase
{


    public function initialize(){

        $this->view->setTemplateBefore('collapsed-sidebar');
        
    }

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for payments
     */
    public function searchAction()
    {

        if ($this->request->isAjax() == true) {
            
            $name = $this->request->getPost('querystr');
            $name = $name."%";

            $customers = Customers::find(
                [
                "conditions" => "name LIKE ?1",
                "bind"       => [
                    1 => "{$name}",
                ]
            ]);

            echo json_encode($customers);


            $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
            return;
        }
         
        $numberPage = 1;

        if ($this->request->isPost()) {

            $query = Criteria::fromInput($this->di, 'Vokuro\Models\Payments', $_POST);
            $this->persistent->parameters = $query->getParams();

        } else {
            $this->persistent->parameters = null;
            $numberPage = $this->request->getQuery("page", "int");

        }
        
        $parameters = $this->persistent->parameters;
        
        if (!is_array($parameters)) {
            $parameters = [];
        }

        $parameters["order"] = "date DESC";

        $payments = Payments::find($parameters);

        if (count($payments) == 0) {
            $this->flash->notice("The search did not find any payments");

            $this->dispatcher->forward([
                "controller" => "payments",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $payments,
            'limit'=> 10,
            'page' => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * Displays the creation form
     */
    public function newAction()
    {
        $form = new PaymentsForm(null);

        $this->view->form = $form;
    }

    /**
     * Edits a payment
     *
     * @param string $id
     */
    public function editAction($id)
    {

        if ($this->request->isAjax() == true) {
            
            $name = $this->request->getPost('querystr');
            $name = "%".$name."%";

            $customers = Customers::find(
                [
                "conditions" => "name LIKE ?1",
                "bind"       => [
                    1 => "{$name}",
                ]
            ]);

            echo json_encode($customers);


            $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
            return;
        }


      $payment = Payments::findFirstByid($id);

       if (!$payment) {
            $this->flash->error("payment was not found");
            $this->dispatcher->forward([
                'controller' => "payments",
                'action' => 'index'
            ]);
            return;
        }

         $this->view->form = new PaymentsForm($payment , ['edit' => true]);
    }

    /**
     * Creates a new payment
     */
    public function createAction()
    {
        
        if ($this->request->isAjax() == true) {
            
            $name = $this->request->getPost('querystr');
            $name = "%".$name."%";

            $customers = Customers::find(
                [
                "conditions" => "name LIKE ?1",
                "bind"       => [
                    1 => "{$name}",
                ]
            ]);

            echo json_encode($customers);


            $this->view->setRenderLevel(View::LEVEL_NO_RENDER);
            return;
        }


        $form = new PaymentsForm(null);

        if ($this->request->isPost()) {

            if ($form->isValid($this->request->getPost()) == false) {
                
                foreach ($form->getMessages() as $message) {
                    $this->flash->error($message);
                }
                
            }else{


                $payment = new Payments();
                $payment->date = $this->request->getPost("date");
                $payment->amount = $this->request->getPost("amount");
                $payment->customerId = $this->request->getPost("customerId");


                if (!$payment->save()) {
                    foreach ($payment->getMessages() as $message) {
                        $this->flash->error($message);
                    }

                    $this->dispatcher->forward([
                        'controller' => "payments",
                        'action' => 'new'
                    ]);

                    return;
                }

                $this->flash->success("payment was created successfully");

                $this->dispatcher->forward([
                    'controller' => "payments",
                    'action' => 'edit',
                    'params' => [$payment->id],
                ]);


            }
            
        }

        $this->view->form = $form;

       
    }

    /**
     * Saves a payment edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "payments",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $payment = Payments::findFirstByid($id);

        if (!$payment) {
            $this->flash->error("payment does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "payments",
                'action' => 'index'
            ]);

            return;
        }

        $payment->date = $this->request->getPost("date");
        $payment->amount = $this->request->getPost("amount");
        $payment->customerId = $this->request->getPost("customerId");
        
        if (!$payment->save()) {

            foreach ($payment->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "payments",
                'action' => 'edit',
                'params' => [$payment->id]
            ]);

            return;
        }

        $this->flash->success("payment was updated successfully");

        $this->dispatcher->forward([
            'controller' => "payments",
            'action' => 'search'
        ]);
    }

    /**
     * Deletes a payment
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $payment = Payments::findFirstByid($id);
        if (!$payment) {
            $this->flash->error("payment was not found");

            $this->dispatcher->forward([
                'controller' => "payments",
                'action' => 'index'
            ]);

            return;
        }

        if (!$payment->delete()) {

            foreach ($payment->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "payments",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("payment was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "payments",
            'action' => "search"
        ]);
    }

}
