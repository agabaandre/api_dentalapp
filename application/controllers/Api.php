<?php defined("BASEPATH") or exit("No direct script access allowed");

require APPPATH . 'libraries/REST_Controller.php';

class Api extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model("Auth", "authHandler");
        $this->load->model("Request", "requestHandler");
        $this->load->model("Employee", "employeeHandler");
        $this->key = urldecode($this->uri->segment(3));
    }

    public function index_get()
    {
        $this->response("ST MARYS DENTAL SERVICES API", REST_Controller::HTTP_OK);
    }

    public function login_post()
    {
        $userdata= $this->security->xss_clean($this->input->raw_input_stream);
        $data= json_decode($userdata);
       if ($this->Authorise($this->key)=='Valid Key'){
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
        if ($this->Authorise($this->key)=='Valid Key'){
        $requestData = $this->requestHandler->get_requests();
        if ($requestData){
        $results = array("msg"=>"Data Found", "requests"=> $requestData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        else{
        $results = array("msg"=>"No Data Found", "requests"=> $requestData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
    }
    }
    public function searchRequest_post()
    {
        if ($this->Authorise($this->key)=='Valid Key'){
        $postData= $this->security->xss_clean($this->input->raw_input_stream);
        $data= json_decode($postData);
        if(!empty($data->searchTerm)){
        $requestData = $this->requestHandler->get_request($data->searchTerm);
        }
        if ($requestData){
        $results = array("msg"=>"Data Found", "requests"=> $requestData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        else{
        $results = array("msg"=>"No Data Found", "requests"=> $requestData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
     }
    }
    public function doctors_get(){
        if ($this->Authorise($this->key)=='Valid Key'){
        $doctorData = $this->employeeHandler->get_doctor();
        if ($doctorData){
        $results = array("msg"=>"Data Found", "requests"=> $doctorData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        else{
        $results = array("msg"=>"No Data Found", "requests"=> $doctorData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
    }
    }
    public function services_get(){
        if ($this->Authorise($this->key)=='Valid Key'){
        $servicesData = $this->employeeHandler->get_services();
        if ($servicesData){
        $results = array("msg"=>"Data Found", "requests"=> $servicesData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        else{
        $results = array("msg"=>"No Data Found", "requests"=> $servicesData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
    }
    }
    public function availableDoctors_post(){
        if ($this->Authorise($this->key)=='Valid Key'){
        $postData= $this->security->xss_clean($this->input->raw_input_stream);
        $data= json_decode($postData);
        if(!empty($data->searchDate)){
        $doctorData = $this->employeeHandler->get_availabledoctors($data->searchDate);
        }
        if ($doctorData){
        $results = array("msg"=>"Data Found", "requests"=> $doctorData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        else{
        $results = array("msg"=>"No Data Found", "requests"=> $doctorData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
    }
    }

    public function request_post()
    {
        if ($this->Authorise($this->key)=='Valid Key'){
        $data= $this->security->xss_clean($this->input->raw_input_stream);
        $postData = json_decode($data);
        print_r($postData);

        $today=date('Y-m-d');
        if($postData->requested_date < $today){
        $this->response(array('error'=> 'FAILED', 'status'=>'FAILED', 'message'=>'Past date'), REST_Controller::HTTP_OK);
        }
      
        elseif (empty($postData->name)) {
        $this->response(array('error'=> 'FAILED', 'status'=>'FAILED', 'message'=>'Provide your name'), REST_Controller::HTTP_OK);
        }
        elseif (empty($postData->mobile)) {
        $this->response(array('error'=> 'FAILED', 'status'=>'FAILED', 'message'=>'Provide your Contact'), REST_Controller::HTTP_OK);
        }
        else {
        $result = $this->requestHandler->post_request($postData);
        if($result) {
        $this->response(array( 'error' => '', 'status'=> 'CREATED','message'=>'Submitted'), REST_Controller::HTTP_CREATED);
        } 
        else {
        $this->response(array('error'=> 'FAILED', 'status'=>'FAILED', 'message'=>'Submission Failed'), REST_Controller::HTTP_OK);
        }
    }
  }
}
    

}
