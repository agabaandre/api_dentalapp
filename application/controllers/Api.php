<?php defined("BASEPATH") or exit("No direct script access allowed");

require APPPATH . 'libraries/REST_Controller.php';

class Api extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model("Auth", "authHandler");
        $this->load->model("Request", "requestHandler");
        // $this->$key = ($_GET['KEY']); // this is for when the key is sent through URL
              }

    public function index_get()
    {
        $this->response("ST MARYS DENTAL SERVICES API", REST_Controller::HTTP_OK);
    }

  

    public function login_post()
    {
        $userdata= $this->security->xss_clean($this->input->raw_input_stream);
        $data= json_decode($userdata);
       // print_r($data->KEY);

       if  ($key=$this->Authorise($data->KEY)=='Valid Key'){
        $userInfo = $this->authHandler->authenticate($data);
    
        if(isset($userInfo)) {
            $response = array("status"=>"USER_FOUND","message"=>"Successfully authenticated","user"=>$userInfo);
            $this->response($response, REST_Controller::HTTP_OK);
        } else {
            $response = array("error"=>"ERROR_OCCURRED", "status" => "USER_NOT_FOUND", "message" => "Unable to authenticated", "user" => null);
            $this->response($response, REST_Controller::HTTP_OK);
        }
        }
        
    }
    public function Authorise($key){
        //validate key{   
        $apikey = $this->authHandler->validate($key);
        if ($apikey){
    return 'Valid Key';
        }
        else{
    return 'Invalid Key';     
        }
    }

    public function requests_get()
    {
        $requestData = $this->requestHandler->get_requests();
        $this->response($requestData, REST_Controller::HTTP_OK);
    }

    public function request_get($personId = null)
    {
        if($personId != null || !empty($personId)) {
            $requestData = $this->requestHandler->get_request($personId);
        } else {
            $requestData = $this->requestHandler->get_request();
        }
        $results = array("error"=>"", "requests"=> $requestData);
        $this->response($results, REST_Controller::HTTP_OK);
    }

    public function request_post()
    {
        $data = $this->input->post();
        $postData = json_decode($data);

        $today=date('Y-m-d');
        if($postData->requested_date < $today){
            $this->response(array('error'=> 'FAILED', 'status'=>'FAILED', 'message'=>'Date From is a past date'), REST_Controller::HTTP_OK);
        }
      
     elseif (empty($postData->name)) {
           $this->response(array('error'=> 'FAILED', 'status'=>'FAILED', 'message'=>'Please provide your name'), REST_Controller::HTTP_OK);
       }
       elseif (empty($postData->mobile)) {
        $this->response(array('error'=> 'FAILED', 'status'=>'FAILED', 'message'=>'Please provide your Contact'), REST_Controller::HTTP_OK);
    }
     else {
    //  call model
        $result = $this->requestHandler->post_request($postData);
        if($result) {
             $this->response(array( 'error' => '', 'status'=> 'CREATED','message'=>'Request Submitted'), REST_Controller::HTTP_CREATED);
         } else {
             $this->response(array('error'=> 'FAILED', 'status'=>'FAILED', 'message'=>'Request submission failed'), REST_Controller::HTTP_OK);
         }
    }
  }
    

    public function reasons_get() 
    {
        $reasons = $this->reasonHandler->get_reasons();
        if(isset($reasons) && !empty($reasons)) {
            $result = array('error'=>'','reasons'=>$reasons);
            $this->response($result, REST_Controller::HTTP_OK);
        } else {
            $result = array('error' => 'ERROR_OCCURRED', 'reasons' => '');
            $this->response($result, REST_Controller:: HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function workshop_dates_get($personId = null)
    {
        if($personId != null) {
            $results = $this->workshopHandler->get_workshop_dates($personId);
        } else {
            $results = array();
        }

        if(isset($results) && !empty($results)) {
            $response = array('buttonStatus'=>'ENABLED', 'requestId'=>$results->entry_id);
        } else {
            $response = array('buttonStatus'=>'DISABLED', 'requestId'=>'');
        }

        $this->response($response, REST_Controller::HTTP_OK);
        
    }

    public function workshopdata_post()
    {
        $userdata = $this->input->post();
        $results = $this->workshopHandler->post_workshop_data($userdata);

        if(isset($results) && !empty($results)) {
            $response = array('buttonStatus'=>'ENABLED');
        } else {
            $response = array('buttonStatus'=>'DISABLED');
        }

        $this->response($response, REST_Controller::HTTP_OK);

    }

    public function pending_requests_get($personId = null) 
    
    {
        if($personId != null || !empty($personId)) {
            $pendingRequests = $this->requestHandler->get_pending_requests($personId);    
        }
        else{
            $pendingRequests = $this->requestHandler->get_pending_requests();
        }
        $pendingRequests = $this->requestHandler->get_pending_requests($personId);
        if(isset($pendingRequests) && !empty($pendingRequests)) {
            $response = array('status'=>"SUCCESS", 'error'=>"", 'pendingRequests'=> $pendingRequests);
            $this->response($response, REST_Controller::HTTP_OK);
        } else {
            $response = array('error' => 'TRUE', 'status' => 'ERROR_OCCURRED');
            $this->response($response, REST_Controller::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
    public function approve_request_post(){
        $entryid = $this->input->post();
        $entryid=$entryid['entry_id'];
        $sendRequest=$this->requestHandler->approveRequest($entryid);
        if ($sendRequest){
            
            $results = array('status'=>'SUCCESS', 'error'=> '', 'message'=> 'Successful');
            $this->response($results, REST_Controller::HTTP_CREATED);
        } else {
            $results = array('status'=>'FAILED', 'error'=> '', 'message'=> 'Failed');
            $this->response($results, REST_Controller::HTTP_OK);
        }

    }
    public function reject_request_post(){
        $entryid = $this->input->post();
        $entryid=$entryid['entry_id'];
        $sendRequest=$this->requestHandler->rejectRequest($entryid);
        if ($sendRequest){
            
            $results = array('status'=>'SUCCESS', 'error'=> '', 'message'=> 'Successful');
            $this->response($results, REST_Controller::HTTP_CREATED);
        } else {
            $results = array('status'=>'FAILED', 'error'=> '', 'message'=> 'Failed');
            $this->response($results, REST_Controller::HTTP_OK);
        }
	}
}
