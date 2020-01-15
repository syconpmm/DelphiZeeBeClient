unit gateway_protocol.Proto;

// This is a generated unit! Do NOT edit!

interface

uses
  System.SysUtils,
  Grijjy.ProtocolBuffers;

type
   TStringArray = Array of string;
   TResourceType = (
      _FILE = 0,
      BPMN = 1,
      YAML = 2);

   TPartitionBrokerRole = (
      LEADER = 0,
      FOLLOWER = 1);

   TActivateJobsRequest = record
      [Serialize(1)] _type: string;
      [Serialize(2)] worker: string;
      [Serialize(3)] timeout: Int64;
      [Serialize(4)] maxJobsToActivate: Integer;
      [Serialize(5)] fetchVariable: TStringArray;
      [Serialize(6)] requestTimeout: Int64;
   end;
   TActivateJobsRequestArray =  Array of TActivateJobsRequest;

   TActivatedJob = record
      [Serialize(1)] key: UInt64;
      [Serialize(2)] _type: string;
      [Serialize(3)] workflowInstanceKey: UInt64;
      [Serialize(4)] bpmnProcessId: string;
      [Serialize(5)] workflowDefinitionVersion: Integer;
      [Serialize(6)] workflowKey: UInt64;
      [Serialize(7)] elementId: string;
      [Serialize(8)] elementInstanceKey: UInt64;
      [Serialize(9)] customHeaders: string;
      [Serialize(10)] worker: string;
      [Serialize(11)] retries: Word;
      [Serialize(12)] deadline: UInt64;
      [Serialize(13)] variables: string;
   end;
   TActivatedJobArray =  Array of TActivatedJob;

   TActivateJobsResponse = record
      [Serialize(1)] jobs: TActivatedJobArray;
   end;
   TActivateJobsResponseArray =  Array of TActivateJobsResponse;

   TCancelWorkflowInstanceRequest = record
      [Serialize(1)] workflowInstanceKey: Int64;
   end;
   TCancelWorkflowInstanceRequestArray =  Array of TCancelWorkflowInstanceRequest;

   TCancelWorkflowInstanceResponse = record
   end;
   TCancelWorkflowInstanceResponseArray =  Array of TCancelWorkflowInstanceResponse;

   TCompleteJobRequest = record
      [Serialize(1)] jobKey: UInt64;
      [Serialize(2)] variables: string;
   end;
   TCompleteJobRequestArray =  Array of TCompleteJobRequest;

   TCompleteJobResponse = record
   end;
   TCompleteJobResponseArray =  Array of TCompleteJobResponse;

   TCreateWorkflowInstanceRequest = record
      [Serialize(1)] workflowKey: UInt64; {NULL: TUInt64(-1)}
      [Serialize(2)] bpmnProcessId: string;
      [Serialize(3)] version: UInt32;  {Latest TUInt32(-1)}
      [Serialize(4)] variables: string;
   end;

{PMM: 12.12.2019 Da stimmt was nicht mit dem Type (variante?
   TCreateWorkflowInstanceRequest_0 = record
      [Serialize(1)] workflowKey: UInt64;
      [Serialize(2)] version: Integer;
      [Serialize(3)] variables: string;
   end;
   TCreateWorkflowInstanceRequest_1 = record
      [Serialize(1)] variables: string;
      [Serialize(2)] bpmnProcessId: String;
      [Serialize(3)] version: Integer;
   end;
   TCreateWorkflowInstanceRequestArray =  Array of TCreateWorkflowInstanceRequest_1;
}

   TCreateWorkflowInstanceResponse = record
      [Serialize(1)] workflowKey: UInt64;
      [Serialize(2)] bpmnProcessId: string;
      [Serialize(3)] version: Integer;
      [Serialize(4)] workflowInstanceKey: UInt64;
   end;
   TCreateWorkflowInstanceResponseArray =  Array of TCreateWorkflowInstanceResponse;

   TCreateWorkflowInstanceWithResultRequest = record
      [Serialize(1)] request: TCreateWorkflowInstanceRequest;
      [Serialize(2)] requestTimeout: Int64;
      [Serialize(3)] fetchVariables: TStringArray;
   end;
   TCreateWorkflowInstanceWithResultRequestArray =  Array of TCreateWorkflowInstanceWithResultRequest;

   TCreateWorkflowInstanceWithResultResponse = record
      [Serialize(1)] workflowKey: Int64;
      [Serialize(2)] bpmnProcessId: string;
      [Serialize(3)] version: Integer;
      [Serialize(4)] workflowInstanceKey: Int64;
      [Serialize(5)] variables: string;
   end;
   TCreateWorkflowInstanceWithResultResponseArray =  Array of TCreateWorkflowInstanceWithResultResponse;

   TWorkflowRequestObject = record
      [Serialize(1)] name: string;
      [Serialize(2)] _type: TResourceType;
      [Serialize(3)] definition: TBytes;
   end;
   TWorkflowRequestObjectArray =  Array of TWorkflowRequestObject;

   TDeployWorkflowRequest = record
      [Serialize(1)] workflows: TWorkflowRequestObjectArray;
   end;
   TDeployWorkflowRequestArray =  Array of TDeployWorkflowRequest;

   TWorkflowMetadata = record
      [Serialize(1)] bpmnProcessId: string;
      [Serialize(2)] version: Integer;
      [Serialize(3)] workflowKey: UInt64;
      [Serialize(4)] resourceName: string;
   end;
   TWorkflowMetadataArray =  Array of TWorkflowMetadata;

   TDeployWorkflowResponse = record
      [Serialize(1)] key: UInt64;
      [Serialize(2)] workflows: TWorkflowMetadataArray;
   end;
   TDeployWorkflowResponseArray =  Array of TDeployWorkflowResponse;

   TFailJobRequest = record
      [Serialize(1)] jobKey: Int64;
      [Serialize(2)] retries: Integer;
      [Serialize(3)] errorMessage: string;
   end;
   TFailJobRequestArray =  Array of TFailJobRequest;

   TFailJobResponse = record
   end;
   TFailJobResponseArray =  Array of TFailJobResponse;

   TPublishMessageRequest = record
      [Serialize(1)] name: string;
      [Serialize(2)] correlationKey: string;
      [Serialize(3)] timeToLive: Int64;
      [Serialize(4)] messageId: string;
      [Serialize(5)] variables: string;
   end;
   TPublishMessageRequestArray =  Array of TPublishMessageRequest;

   TPublishMessageResponse = record
   end;
   TPublishMessageResponseArray =  Array of TPublishMessageResponse;

   TResolveIncidentRequest = record
      [Serialize(1)] incidentKey: Int64;
   end;
   TResolveIncidentRequestArray =  Array of TResolveIncidentRequest;

   TResolveIncidentResponse = record
   end;
   TResolveIncidentResponseArray =  Array of TResolveIncidentResponse;
{PMM 12.12.2019 leere Records sind nicht erlaubt
   TTopologyRequest = record
   end;
   TTopologyRequestArray =  Array of TTopologyRequest;
}
   TPartition = record
      [Serialize(1)] partitionId: Integer;
      [Serialize(2)] role: TPartitionBrokerRole;
   end;
   TPartitionArray =  Array of TPartition;

   TBrokerInfo = record
      [Serialize(1)] nodeId: Integer;
      [Serialize(2)] host: string;
      [Serialize(3)] port: Integer;
      [Serialize(4)] partitions: TPartitionArray;
   end;
   TBrokerInfoArray =  Array of TBrokerInfo;

   TTopologyResponse = record
      [Serialize(1)] brokers: TBrokerInfoArray;
      [Serialize(2)] clusterSize: Integer;
      [Serialize(3)] partitionsCount: Integer;
      [Serialize(4)] replicationFactor: Integer;
   end;
   TTopologyResponseArray =  Array of TTopologyResponse;

   TUpdateJobRetriesRequest = record
      [Serialize(1)] jobKey: Int64;
      [Serialize(2)] retries: Integer;
   end;
   TUpdateJobRetriesRequestArray =  Array of TUpdateJobRetriesRequest;

   TUpdateJobRetriesResponse = record
   end;
   TUpdateJobRetriesResponseArray =  Array of TUpdateJobRetriesResponse;

   TSetVariablesRequest = record
      [Serialize(1)] elementInstanceKey: Int64;
      [Serialize(2)] variables: string;
      [Serialize(3)] local: Boolean;
   end;
   TSetVariablesRequestArray =  Array of TSetVariablesRequest;

   TSetVariablesResponse = record
   end;
   TSetVariablesResponseArray =  Array of TSetVariablesResponse;

implementation

end.
