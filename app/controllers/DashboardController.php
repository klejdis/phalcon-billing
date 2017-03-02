<?php
namespace Vokuro\Controllers;

use Vokuro\Models\Customers;
use Vokuro\Models\Payments;


/**
 * Display the "About" page.
 */
class DashboardController extends ControllerBase
{

	public function initialize(){

		 $this->assets->addCss('assets/js/plugins/datatables/dataTables.bootstrap.css');
		 $this->assets->addJs('assets/js/plugins/datatables/jquery.dataTables.min.js');
		 $this->assets->addJs('assets/js/plugins/datatables/dataTables.bootstrap.min.js');
		 
	}

    /**
     * Default action. Set the public layout (layouts/public.volt)
     */
    public function indexAction()
    {
        $this->view->setTemplateBefore('collapsed-sidebar');


        //GET DASHBOARD STATISTICS

        //TOTAL CLIENTS
        $customers = Customers::find();
        $totalCustomers = count($customers);
        $this->view->totalCustomers = $totalCustomers;

        //PAID
        $currentDate =  date('Y-m-d'); 
        $payments = Payments::find([
        	'conditions' => 'year(date) = year(curdate())
								and month(date) = month(curdate())'
        ]);
        $totalPayments = count($payments);
        $this->view->totalPayments = $totalPayments;


        //PAID CLIENTS
	    $paidCustomers = Customers::find([
	    	'conditions' => ' id IN ( SELECT customerId FROM Vokuro\Models\Payments WHERE  year(date) = year(curdate()) AND month(date) = month(curdate()) )'
	    ]);
	    $this->view->paid = $paidCustomers;


	     //DEBITOR CLIENTS
	    $debitorCustomers = Customers::find([
	    	'conditions' => ' id NOT IN ( SELECT customerId FROM Vokuro\Models\Payments WHERE  year(date) = year(curdate()) AND month(date) = month(curdate()) )'
	    ]);
	    $this->view->debitor = $debitorCustomers;

	    if ($this->request->isPost()) {

	    	$type = $this->request->getPost('type');
	    	$month = $this->request->getPost('month');

	    	if ($type == 'debitor') {
	    		 
	    		//DEBITOR CLIENTS
			    $sdebitorCustomers = Customers::find([
			    	'conditions' => ' id NOT IN ( SELECT customerId FROM Vokuro\Models\Payments WHERE  year(date) = year(curdate()) AND month(date) = month( ?1 ) )',
			    	'bind' => [
			    				1 => $month,
			    			  ]
			    ]);

			    $this->view->search = $sdebitorCustomers;
	    	
	    	}else{

		    	//DEBITOR CLIENTS
			    $spaidCustomers = Customers::find([
			    	'conditions' => ' id IN  ( SELECT customerId FROM Vokuro\Models\Payments WHERE  year(date) = year(curdate()) AND month(date) = month( ?1 ) )',
			    	'bind' => [
			    				1 => $month,
			    			  ]
			    ]);
			    $this->view->search = $spaidCustomers;

	    	}


	    }



    }
}
