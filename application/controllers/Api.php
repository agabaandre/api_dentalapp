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

        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if ($method == "OPTIONS") {
            die();
        }
    }

    public function index_get()
    {
        $this->response("ST MARYS DENTAL SERVICES API", REST_Controller::HTTP_OK);
    }
    function logData($decolator='Log',$data){
        if(is_object($data) || is_array($data))
            $data = json_encode($data);
        $message ="\n---------New ".$decolator." ".date('Y-m-d h:i')."----\n".$data;
        log_message("error",$message);
    }

    public function login_post()
    {
        header("Access-Control-Allow-Origin: *");
        $userdata= $this->security->xss_clean($this->input->raw_input_stream);
        $logindata= json_decode($userdata);
        $this->logData('Login',$userdata);
        $this->logData('Decoded Login',$logindata);

       if ($this->Authorise($this->key,'Login')=='Valid Key'){
        $userInfo = $this->authHandler->authenticate($logindata);
        
        $this->logData('Login response',$userInfo);
    
        if($userInfo) {
        $response = array("msg"=>"USER_FOUND","status"=>"Authenticated","user"=>$userInfo);
        $this->response($response, REST_Controller::HTTP_OK);
        } else {
        $response = array("msg"=>"ERROR_OCCURRED", "status" => "Authentication Failed", "user" => null);
        $this->response($response, REST_Controller::HTTP_OK);
        }
        }
    }
    public function Authorise($key,$action=NULL){  
        $apikey = $this->authHandler->validate($key);
        if ($apikey){
        $log = $this->authHandler->log($key,$action);
        return 'Valid Key';
        }
        else{
        return 'Invalid Key';     
        }

    }
    public function requests_get()
    {
        if ($this->Authorise($this->key,'Fecthed Requests')=='Valid Key'){
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
    public function cancelRequest_post()
    {
        if ($this->Authorise($this->key,'Cancel Request and Delete is messages')=='Valid Key'){
        $postData= $this->security->xss_clean($this->input->raw_input_stream);
        $data= json_decode($postData);
        $requestData = $this->requestHandler->cancelRequest($data->requestId);
        if ($requestData){
        $results = array("msg"=>"Cancelled", "requests"=> $requestData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        else{
        $results = array("msg"=>"Failed", "requests"=> $requestData);
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
       // print_r($postData);
        $today=date('Y-m-d');
        if($postData->requested_date < $today){
        $this->response(array('error'=> 'FAILED', 'msg'=>'FAILED', 'message'=>'Past date'), REST_Controller::HTTP_OK);
        }
      
        elseif (empty($postData->name)) {
        $this->response(array('error'=> 'FAILED', 'msg'=>'FAILED', 'message'=>'Provide your name'), REST_Controller::HTTP_OK);
        }
        elseif (empty($postData->mobile)) {
        $this->response(array('error'=> 'FAILED', 'msg'=>'FAILED', 'message'=>'Provide your Contact'), REST_Controller::HTTP_OK);
        }
        else {
        $result = $this->requestHandler->saveRequest($postData);
        if($result) {
        $this->response(array( 'error' => '', 'msg'=> 'CREATED','message'=>'Submitted','userinfo'=>$result), REST_Controller::HTTP_CREATED);
        } 
        else {
        $this->response(array('error'=> 'FAILED', 'msg'=>'FAILED', 'message'=>'Submission Failed','userinfo'=>$result), REST_Controller::HTTP_OK);
        }
        }
        }
    }
    public function newdoctor_post()
    {
        if ($this->Authorise($this->key)=='Valid Key'){
        $data= $this->security->xss_clean($this->input->raw_input_stream);
        $postData = json_decode($data);
       // print_r($postData);
    
        if(empty($postData->mobile)){
        $this->response(array('error'=> 'FAILED', 'msg'=>'FAILED', 'message'=>'Mobile is required'), REST_Controller::HTTP_OK);
        }
      
        elseif (empty($postData->name)) {
        $this->response(array('error'=> 'FAILED', 'msg'=>'FAILED', 'message'=>'Provide a Name'), REST_Controller::HTTP_OK);
        }
    
        else {
        $result = $this->requestHandler->add_doctor($postData);
        if($result) {
        $this->response(array( 'error' => '', 'msg'=> 'CREATED','message'=>'Submitted','logins'=>$result), REST_Controller::HTTP_CREATED);
        } 
        else {
        $this->response(array('error'=> 'FAILED', 'msg'=>'FAILED', 'message'=>'Submission Failed'), REST_Controller::HTTP_OK);
             }
            }
        }
    }
    public function messages_get(){
        if ($this->Authorise($this->key)=='Valid Key'){
        $messageData = $this->requestHandler->getMessages();
        if ($messageData){
        $results = array("msg"=>"Data Found", "messages"=> $messageData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        else{
        $results = array("msg"=>"No Data Found", "messages"=> $messageData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        }
    }
    public function message_post(){
        $data= $this->security->xss_clean($this->input->raw_input_stream);
        $postData = json_decode($data);
        if ($this->Authorise($this->key)=='Valid Key'){
        $messageData = $this->requestHandler->getMessages($postData);
        if ($messageData){
        $results = array("msg"=>"Data Found", "messages"=> $messageData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        else{
        $results = array("msg"=>"No Data Found", "messages"=> $messageData);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        }
    }
    public function replymessages_post(){
        $postData= $this->security->xss_clean($this->input->raw_input_stream);
        $data= json_decode($postData);
        if ($this->Authorise($this->key)=='Valid Key'){
        $replyStatus = $this->requestHandler->replyMessages($data);
        if ($replyStatus){
        $results = array("msg"=>"Success", "messages"=> $replyStatus);
        $this->response($results, REST_Controller::HTTP_CREATED);
        }
        else{
        $results = array("msg"=>"Failed", "messages"=> $replyStatus);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        }
    }
    public function changePassword_post(){
        $postData= $this->security->xss_clean($this->input->raw_input_stream);
        $data= json_decode($postData);
        if ($this->Authorise($this->key)=='Valid Key'){
        $replyStatus = $this->requestHandler->changepwd($data);
        if ($replyStatus){
        $results = array("msg"=>"Success", "messages"=> $replyStatus);
        $this->response($results, REST_Controller::HTTP_CREATED);
        }
        else{
        $results = array("msg"=>"Failed", "messages"=> $replyStatus);
        $this->response($results, REST_Controller::HTTP_OK);
        }
        }
    }


}
    


