{*

/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2011 SugarCRM Inc.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 * 
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 * 
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 * 
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 ********************************************************************************/




*}

{$INSTRUCTION}

<div class="hr"></div>

<form enctype="multipart/form-data" real_id="importconfirm" id="importconfirm" name="importconfirm" method="POST" action="index.php">
<input type="hidden" name="module" value="Import">
<input type="hidden" name="type" value="{$TYPE}">
<input type="hidden" name="source" id="source" value="{$SOURCE}">
<input type="hidden" name="source_id" value="{$SOURCE_ID}">
<input type="hidden" name="action" value="Step3">
<input type="hidden" name="import_module" value="{$IMPORT_MODULE}">
<input type="hidden" name="import_type" value="{$TYPE}">
<input type="hidden" name="file_name" value="{$FILE_NAME}">
<input type="hidden" name="current_step" value="{$CURRENT_STEP}">
<input type="hidden" name="from_admin_wizard" value="{$smarty.request.from_admin_wizard}">
    
{if $AUTO_DETECT_ERROR != ''}
    <div class="errorMessage">
        <span class="error">{$AUTO_DETECT_ERROR}</span>
    </div>
{/if}

<div id="confirm_table" class="confirmTable">
{include file='modules/Import/tpls/confirm_table.tpl'}
</div>



    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="left" colspan="4" style="background: transparent;">
                <input title="{$MOD.LBL_SHOW_ADVANCED_OPTIONS}" accessKey="" id="toggleImportOptions" class="button" type="button"
                       name="button" value="  {$MOD.LBL_SHOW_ADVANCED_OPTIONS}  "> {sugar_help text=$MOD.LBL_IMPORT_FILE_SETTINGS_HELP}
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
            <div style="overflow: auto; width: 1056px;">
                <table border=0 class="edit view noBorder" style="display: none;" id="importOptions">
                    <tr>
                        <td scope="row">
                            <slot>{$MOD.LBL_CHARSET}</slot>
                        </td>
                        <td>
                            <slot><select tabindex='4' name='importlocale_charset'>{$CHARSETOPTIONS}</select></slot>
                        </td>
                        <td scope="row">
                            <slot>{$MOD.LBL_CUSTOM_DELIMITER}</slot>
                        </td>
                        <td>
                            <slot>
                                <select name="custom_delimiter" id="custom_delimiter"> {$IMPORT_DELIMETER_OPTIONS}</select>
                                <input type="text" name="custom_delimiter_other" id="custom_delimiter_other" style="display: none; width: 5em;" maxlength="1" />
                                {sugar_help text=$MOD.LBL_FIELD_DELIMETED_HELP}
                            </slot>
                        </td>
                    </tr>
                    <tr>
                        <td scope="row">
                            <slot>{$MOD.LBL_CUSTOM_ENCLOSURE}</slot>
                        </td>
                        <td>
                            <slot>
                                <select name="custom_enclosure" id="custom_enclosure">
                                {$IMPORT_ENCLOSURE_OPTIONS}
                                </select>
                                <input type="text" name="custom_enclosure_other" id="custom_enclosure_other" style="display: none; width: 5em;" maxlength="1" />
                            {sugar_help text=$MOD.LBL_ENCLOSURE_HELP}
                            </slot>
                        </td>
                        <td scope="row">
                        {$MOD.LBL_HAS_HEADER}
                        </td>
                        <td>
                            <input class="checkBox" value='on' type="checkbox" name="has_header" id="has_header" {$HAS_HEADER_CHECKED}> {sugar_help text=$MOD.LBL_HEADER_ROW_OPTION_HELP}
                        </td>
                    </tr>
                    <tr>
                        <td scope="row"><slot>{$MOD.LBL_DATE_FORMAT}</slot></td>
                        <td ><slot><select tabindex='4' name='importlocale_dateformat'>{$DATEOPTIONS}</select></slot></td>
                        <td scope="row"><slot>{$MOD.LBL_TIME_FORMAT}</slot></td>
                        <td ><slot><select tabindex='4' name='importlocale_timeformat'>{$TIMEOPTIONS}</select></slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot>{$MOD.LBL_TIMEZONE}</slot></td>
                        <td ><slot><select tabindex='4' name='importlocale_timezone'>{html_options options=$TIMEZONEOPTIONS selected=$TIMEZONE_CURRENT}</select></slot></td>
                        <td scope="row"><slot>{$MOD.LBL_CURRENCY}</slot></td>
                        <td ><slot>
                            <select tabindex='4' id='currency_select' name='importlocale_currency' onchange='setSymbolValue(this.selectedIndex);setSigDigits();'>{$CURRENCY}</select>
                            <input type="hidden" id="symbol" value="">
                        </slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot>{$MOD.LBL_CURRENCY_SIG_DIGITS}:</slot></td>
                        <td ><slot><select id='sigDigits' onchange='setSigDigits(this.value);' name='importlocale_default_currency_significant_digits'>{$sigDigits}</select>
                        </slot></td>
                        <td scope="row"><slot><i>{$MOD.LBL_LOCALE_EXAMPLE_NAME_FORMAT}</i>:</slot></td>
                        <td ><slot><input type="text" disabled id="sigDigitsExample" name="sigDigitsExample"></slot></td>
                    </tr>
                    <tr>
                        <td scope="row"><slot>{$MOD.LBL_NUMBER_GROUPING_SEP}</slot></td>
                        <td ><slot>
                            <input tabindex='4' name='importlocale_num_grp_sep' id='default_number_grouping_seperator'
                                   type='text' maxlength='1' size='1' value='{$NUM_GRP_SEP}' onkeydown='setSigDigits();' onkeyup='setSigDigits();'>
                        </slot></td>
                        <td scope="row"><slot>{$MOD.LBL_DECIMAL_SEP}</slot></td>
                        <td ><slot>
                            <input tabindex='4' name='importlocale_dec_sep' id='default_decimal_seperator'
                                   type='text' maxlength='1' size='1' value='{$DEC_SEP}' onkeydown='setSigDigits();' onkeyup='setSigDigits();'>
                        </slot></td>
                    </tr>
                    <tr>
                        <td scope="row" valign="top">{$MOD.LBL_LOCALE_DEFAULT_NAME_FORMAT}: </td>
                        <td  valign="top">
                            <input onkeyup="setPreview();" onkeydown="setPreview();" id="default_locale_name_format" type="text" tabindex='4' name="importlocale_default_locale_name_format" value="{$default_locale_name_format}">
                            <br />{$MOD.LBL_LOCALE_NAME_FORMAT_DESC}
                        </td>
                        <td scope="row" valign="top"><i>{$MOD.LBL_LOCALE_EXAMPLE_NAME_FORMAT}:</i> </td>
                        <td  valign="top"><input tabindex='4' id="nameTarget" name="no_value" id=":q" value="" style="border: none;" disabled size="50"></td>
                    </tr>
                </table>
            </div>
                
            </td>
        </tr>
        <tr>
            <td colspan="2"><div class="hr" style="margin-top: 0px;"></div></td>
        </tr>
        <tr>
            <td colspan="2"><h3>{$MOD.LBL_THIRD_PARTY_CSV_SOURCES}&nbsp;{sugar_help text=$MOD.LBL_THIRD_PARTY_CSV_SOURCES_HELP}</h3></td>
        </tr>
        <tr>
            <td colspan="2" scope="row"><input class="radio" type="radio" name="external_source" value="" id='none' checked='checked'/>&nbsp;{$MOD.LBL_NONE}</td>
        </tr>
        <tr>
            <td colspan="2" scope="row"><input class="radio" type="radio" name="external_source" value="salesforce" id='sf_map'/>&nbsp;{$MOD.LBL_SALESFORCE}</td>
        </tr>
        <tr>
            <td colspan="2" scope="row"><input class="radio" type="radio" name="external_source" value="outlook" id='outlook_map'/>&nbsp;{$MOD.LBL_MICROSOFT_OUTLOOK}&nbsp;{sugar_help text=$MOD.LBL_MICROSOFT_OUTLOOK_HELP}</td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>

    <table width="100%" cellpadding="2" cellspacing="0" border="0">
        <tr>
            <td align="left">
                <input title="{$MOD.LBL_BACK}" accessKey="" id="goback" class="button" type="submit" name="button" value="  {$MOD.LBL_BACK}  ">&nbsp;
                <input title="{$MOD.LBL_NEXT}" accessKey="" class="button" type="submit" name="button" value="  {$MOD.LBL_NEXT}  " id="gonext">
            </td>
        </tr>
    </table>
</form>