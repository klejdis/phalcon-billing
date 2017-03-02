<?php
 
namespace Vokuro\Controllers;

use Vokuro\Models\Client; 
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class ClientController extends ControllerBase
{
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for client
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Vokuro\Models\Client', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $client = Client::find($parameters);
        if (count($client) == 0) {
            $this->flash->notice("The search did not find any client");

            $this->dispatcher->forward([
                "controller" => "client",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $client,
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

    }

    /**
     * Edits a client
     *
     * @param string $id
     */
    public function editAction($id)
    {
        if (!$this->request->isPost()) {

            $client = Client::findFirstByid($id);
            if (!$client) {
                $this->flash->error("client was not found");

                $this->dispatcher->forward([
                    'controller' => "client",
                    'action' => 'index'
                ]);

                return;
            }

            $this->view->id = $client->id;

            $this->tag->setDefault("id", $client->id);
            $this->tag->setDefault("name", $client->name);
            $this->tag->setDefault("surname", $client->surname);
            $this->tag->setDefault("email", $client->email);
            $this->tag->setDefault("gender", $client->gender);
            $this->tag->setDefault("birthday", $client->birthday);
            $this->tag->setDefault("juridiction", $client->juridiction);
            $this->tag->setDefault("phone", $client->phone);
            $this->tag->setDefault("contractStatus", $client->contractStatus);
			 $this->tag->setDefault("address", $client->address);
            
        }
    }

    /**
     * Creates a new client
     */
    public function createAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "client",
                'action' => 'index'
            ]);

            return;
        }

        $client = new Client();
        $client->name = $this->request->getPost("name");
        $client->surname = $this->request->getPost("surname");
        $client->email = $this->request->getPost("email", "email");
        $client->gender = $this->request->getPost("gender");
        $client->birthday = $this->request->getPost("birthday");
        $client->juridiction = $this->request->getPost("juridiction");
        $client->phone = $this->request->getPost("phone");
        $client->contractStatus = $this->request->getPost("contractStatus");
		 $client->address = $this->request->getPost("address");
        

        if (!$client->save()) {
            foreach ($client->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "client",
                'action' => 'new'
            ]);

            return;
        }

        $this->flash->success("client was created successfully");

        $this->dispatcher->forward([
            'controller' => "client",
            'action' => 'index'
        ]);
    }

    /**
     * Saves a client edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "client",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $client = Client::findFirstByid($id);

        if (!$client) {
            $this->flash->error("client does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "client",
                'action' => 'index'
            ]);

            return;
        }

        $client->name = $this->request->getPost("name");
        $client->surname = $this->request->getPost("surname");
        $client->email = $this->request->getPost("email", "email");
        $client->gender = $this->request->getPost("gender");
        $client->birthday = $this->request->getPost("birthday");
        $client->juridiction = $this->request->getPost("juridiction");
        $client->phone = $this->request->getPost("phone");
        $client->contractStatus = $this->request->getPost("contractStatus");
		$client->address = $this->request->getPost("address");
        

        if (!$client->save()) {

            foreach ($client->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "client",
                'action' => 'edit',
                'params' => [$client->id]
            ]);

            return;
        }

        $this->flash->success("client was updated successfully");

        $this->dispatcher->forward([
            'controller' => "client",
            'action' => 'index'
        ]);
    }

    /**
     * Deletes a client
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $client = Client::findFirstByid($id);
        if (!$client) {
            $this->flash->error("client was not found");

            $this->dispatcher->forward([
                'controller' => "client",
                'action' => 'index'
            ]);

            return;
        }

        if (!$client->delete()) {

            foreach ($client->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "client",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("client was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "client",
            'action' => "index"
        ]);
    }

}
