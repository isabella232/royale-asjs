////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.royale.reflection
{
COMPILE::SWF
{
    import flash.utils.getQualifiedSuperclassName;
}
    
    /**
     *  The equivalent of flash.utils.getQualifiedSuperclassName.
     * 
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion Royale 0.0
     */
    public function getQualifiedSuperclassName(value:*):String
	{
        COMPILE::SWF
        {
            return flash.utils.getQualifiedSuperclassName(value).replace('::','.');
        }
        COMPILE::JS
        {
            var constructorAsObject:Object = (value is Class) ? value : value["constructor"];
            value = constructorAsObject.superClass_;
            if (value == null || value.ROYALE_CLASS_INFO == null)
                return null;
            return value.ROYALE_CLASS_INFO.names[0].qName;
        }
    }
}
