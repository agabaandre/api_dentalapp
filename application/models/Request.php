<?php

class Request extends CI_Model
{

    public function get_requests()
    {
        $query = $this->db->get("request");
        if ($query){
            return $query->result();
        }
        else{
            return array();
        }
        
    }
    public function get_request($key)
    {
        if(!empty($key)) {
            $query = $this->db->query("select * from request where client like '%%$key%' or email like '%%$key%' or request_date like'%%$key%' or requested_date like'%%$key'  LIMIT 10 ");
            return $query->result();
        } else {
            return array();
        }
        
    }
    public function saveRequest($data)
    {
            $data=array(
                'client' => $data->client,
                'mobile' => $data->mobile,
                'email' => $data->$email,
                'clinic' => $data->clinic,
                'doctor' => $data->doctor,
                'address'=>$data->address, 
                'request_date' => $data->request_date,
                'requested_date' =>$data->requested_date,
                'services' => $data->services,
                'remarks' => $data->remarks
            );
            $query = $this->db->insert('request',$data);
            $rows=$this->db->affected_rows();
           if($rows>0){
            return array('msg'=>'Success');
         } else {
            return array('msg'=>'Failed');
        }
        
    }
}

 
