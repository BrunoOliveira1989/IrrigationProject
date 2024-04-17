<?php
/**
 * TemplateSummaryDiffTasks
 *
 * PHP version 5
 *
 * @category Class
 * @package  InfluxDB2
 * @author   OpenAPI Generator team
 * @link     https://openapi-generator.tech
 */

/**
 * InfluxDB OSS API Service
 *
 * The InfluxDB v2 API provides a programmatic interface for all interactions with InfluxDB. Access the InfluxDB API using the `/api/v2/` endpoint.
 *
 * OpenAPI spec version: 2.0.0
 * 
 * Generated by: https://openapi-generator.tech
 * OpenAPI Generator version: 3.3.4
 */

/**
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

namespace InfluxDB2\Model;

use \ArrayAccess;
use \InfluxDB2\ObjectSerializer;

/**
 * TemplateSummaryDiffTasks Class Doc Comment
 *
 * @category Class
 * @package  InfluxDB2
 * @author   OpenAPI Generator team
 * @link     https://openapi-generator.tech
 */
class TemplateSummaryDiffTasks implements ModelInterface, ArrayAccess
{
    const DISCRIMINATOR = null;

    /**
      * The original name of the model.
      *
      * @var string
      */
    protected static $openAPIModelName = 'TemplateSummary_diff_tasks';

    /**
      * Array of property to type mappings. Used for (de)serialization
      *
      * @var string[]
      */
    protected static $openAPITypes = [
        'kind' => '\InfluxDB2\Model\TemplateKind',
        'state_status' => 'string',
        'id' => 'string',
        'template_meta_name' => 'string',
        'new' => '\InfluxDB2\Model\TemplateSummaryDiffTasksNewOld',
        'old' => '\InfluxDB2\Model\TemplateSummaryDiffTasksNewOld'
    ];

    /**
      * Array of property to format mappings. Used for (de)serialization
      *
      * @var string[]
      */
    protected static $openAPIFormats = [
        'kind' => null,
        'state_status' => null,
        'id' => null,
        'template_meta_name' => null,
        'new' => null,
        'old' => null
    ];

    /**
     * Array of property to type mappings. Used for (de)serialization
     *
     * @return array
     */
    public static function openAPITypes()
    {
        return self::$openAPITypes;
    }

    /**
     * Array of property to format mappings. Used for (de)serialization
     *
     * @return array
     */
    public static function openAPIFormats()
    {
        return self::$openAPIFormats;
    }

    /**
     * Array of attributes where the key is the local name,
     * and the value is the original name
     *
     * @var string[]
     */
    protected static $attributeMap = [
        'kind' => 'kind',
        'state_status' => 'stateStatus',
        'id' => 'id',
        'template_meta_name' => 'templateMetaName',
        'new' => 'new',
        'old' => 'old'
    ];

    /**
     * Array of attributes to setter functions (for deserialization of responses)
     *
     * @var string[]
     */
    protected static $setters = [
        'kind' => 'setKind',
        'state_status' => 'setStateStatus',
        'id' => 'setId',
        'template_meta_name' => 'setTemplateMetaName',
        'new' => 'setNew',
        'old' => 'setOld'
    ];

    /**
     * Array of attributes to getter functions (for serialization of requests)
     *
     * @var string[]
     */
    protected static $getters = [
        'kind' => 'getKind',
        'state_status' => 'getStateStatus',
        'id' => 'getId',
        'template_meta_name' => 'getTemplateMetaName',
        'new' => 'getNew',
        'old' => 'getOld'
    ];

    /**
     * Array of attributes where the key is the local name,
     * and the value is the original name
     *
     * @return array
     */
    public static function attributeMap()
    {
        return self::$attributeMap;
    }

    /**
     * Array of attributes to setter functions (for deserialization of responses)
     *
     * @return array
     */
    public static function setters()
    {
        return self::$setters;
    }

    /**
     * Array of attributes to getter functions (for serialization of requests)
     *
     * @return array
     */
    public static function getters()
    {
        return self::$getters;
    }

    /**
     * The original name of the model.
     *
     * @return string
     */
    public function getModelName()
    {
        return self::$openAPIModelName;
    }

    

    

    /**
     * Associative array for storing property values
     *
     * @var mixed[]
     */
    protected $container = [];

    /**
     * Constructor
     *
     * @param mixed[] $data Associated array of property values
     *                      initializing the model
     */
    public function __construct(array $data = null)
    {
        $this->container['kind'] = isset($data['kind']) ? $data['kind'] : null;
        $this->container['state_status'] = isset($data['state_status']) ? $data['state_status'] : null;
        $this->container['id'] = isset($data['id']) ? $data['id'] : null;
        $this->container['template_meta_name'] = isset($data['template_meta_name']) ? $data['template_meta_name'] : null;
        $this->container['new'] = isset($data['new']) ? $data['new'] : null;
        $this->container['old'] = isset($data['old']) ? $data['old'] : null;
    }

    /**
     * Show all the invalid properties with reasons.
     *
     * @return array invalid properties with reasons
     */
    public function listInvalidProperties()
    {
        $invalidProperties = [];

        return $invalidProperties;
    }

    /**
     * Validate all the properties in the model
     * return true if all passed
     *
     * @return bool True if all properties are valid
     */
    public function valid()
    {
        return count($this->listInvalidProperties()) === 0;
    }


    /**
     * Gets kind
     *
     * @return \InfluxDB2\Model\TemplateKind|null
     */
    public function getKind()
    {
        return $this->container['kind'];
    }

    /**
     * Sets kind
     *
     * @param \InfluxDB2\Model\TemplateKind|null $kind kind
     *
     * @return $this
     */
    public function setKind($kind)
    {
        $this->container['kind'] = $kind;

        return $this;
    }

    /**
     * Gets state_status
     *
     * @return string|null
     */
    public function getStateStatus()
    {
        return $this->container['state_status'];
    }

    /**
     * Sets state_status
     *
     * @param string|null $state_status state_status
     *
     * @return $this
     */
    public function setStateStatus($state_status)
    {
        $this->container['state_status'] = $state_status;

        return $this;
    }

    /**
     * Gets id
     *
     * @return string|null
     */
    public function getId()
    {
        return $this->container['id'];
    }

    /**
     * Sets id
     *
     * @param string|null $id id
     *
     * @return $this
     */
    public function setId($id)
    {
        $this->container['id'] = $id;

        return $this;
    }

    /**
     * Gets template_meta_name
     *
     * @return string|null
     */
    public function getTemplateMetaName()
    {
        return $this->container['template_meta_name'];
    }

    /**
     * Sets template_meta_name
     *
     * @param string|null $template_meta_name template_meta_name
     *
     * @return $this
     */
    public function setTemplateMetaName($template_meta_name)
    {
        $this->container['template_meta_name'] = $template_meta_name;

        return $this;
    }

    /**
     * Gets new
     *
     * @return \InfluxDB2\Model\TemplateSummaryDiffTasksNewOld|null
     */
    public function getNew()
    {
        return $this->container['new'];
    }

    /**
     * Sets new
     *
     * @param \InfluxDB2\Model\TemplateSummaryDiffTasksNewOld|null $new new
     *
     * @return $this
     */
    public function setNew($new)
    {
        $this->container['new'] = $new;

        return $this;
    }

    /**
     * Gets old
     *
     * @return \InfluxDB2\Model\TemplateSummaryDiffTasksNewOld|null
     */
    public function getOld()
    {
        return $this->container['old'];
    }

    /**
     * Sets old
     *
     * @param \InfluxDB2\Model\TemplateSummaryDiffTasksNewOld|null $old old
     *
     * @return $this
     */
    public function setOld($old)
    {
        $this->container['old'] = $old;

        return $this;
    }
    /**
     * Returns true if offset exists. False otherwise.
     *
     * @param integer $offset Offset
     *
     * @return boolean
     */
    public function offsetExists($offset): bool
    {
        return isset($this->container[$offset]);
    }

    /**
     * Gets offset.
     *
     * @param integer $offset Offset
     *
     * @return mixed
     */
    #[\ReturnTypeWillChange]
    public function offsetGet($offset)
    {
        return isset($this->container[$offset]) ? $this->container[$offset] : null;
    }

    /**
     * Sets value based on offset.
     *
     * @param integer $offset Offset
     * @param mixed   $value  Value to be set
     *
     * @return void
     */
    public function offsetSet($offset, $value): void
    {
        if (is_null($offset)) {
            $this->container[] = $value;
        } else {
            $this->container[$offset] = $value;
        }
    }

    /**
     * Unsets offset.
     *
     * @param integer $offset Offset
     *
     * @return void
     */
    public function offsetUnset($offset): void
    {
        unset($this->container[$offset]);
    }

    /**
     * Gets the string presentation of the object
     *
     * @return string
     */
    public function __toString()
    {
        return json_encode(
            ObjectSerializer::sanitizeForSerialization($this),
            JSON_PRETTY_PRINT
        );
    }
}


