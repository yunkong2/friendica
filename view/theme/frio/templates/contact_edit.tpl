
<div class="generic-page-wrapper">
	{{if $header}}<h3>{{$header|escape}}:&nbsp;{{$name|escape}}{{if $account_type}}&nbsp;<small>({{$account_type|escape}})</small>{{/if}}</h3>{{/if}}

	<div id="contact-edit-wrapper" >

		{{* Insert Tab-Nav *}}
		{{$tab_str}}


		<div id="contact-edit-content-wrapper">
			<form action="contact/{{$contact_id}}" method="post" >

				{{* This is the Action menu where contact related actions like 'ignore', 'hide' can be performed *}}
				<ul id="contact-edit-actions" class="nav nav-pills preferences">
					<li class="dropdown pull-right">
						<button type="button" class="btn btn-link btn-sm dropdown-toggle" id="contact-edit-actions-button" data-toggle="dropdown" aria-expanded="false">
							<i class="fa fa-angle-down" aria-hidden="true"></i>&nbsp;{{$contact_action_button}}
						</button>

						<ul class="dropdown-menu pull-right" role="menu" aria-labelledby="contact-edit-actions-button" aria-haspopup="true" id="contact-actions-menu" >
							{{if $lblsuggest}}<li role="presentation"><a role="menuitem" href="{{$contact_actions.suggest.url}}" title="{{$contact_actions.suggest.title|escape}}">{{$contact_actions.suggest.label|escape}}</a></li>{{/if}}
							{{if $poll_enabled}}<li role="presentation"><a role="menuitem" href="{{$contact_actions.update.url}}" title="{{$contact_actions.update.title|escape}}">{{$contact_actions.update.label|escape}}</a></li>{{/if}}
							{{if $lblsuggest || $poll_enabled}}
							<li role="presentation" class="divider"></li>
							{{/if}}
							<li role="presentation"><a role="menuitem" href="{{$contact_actions.block.url}}" title="{{$contact_actions.block.title|escape}}">{{$contact_actions.block.label|escape}}</a></li>
							<li role="presentation"><a role="menuitem" href="{{$contact_actions.ignore.url}}" title="{{$contact_actions.ignore.title|escape}}">{{$contact_actions.ignore.label|escape}}</a></li>
							{{if $contact_actions.archive.url}}<li role="presentation"><a role="menuitem" href="{{$contact_actions.archive.url}}" title="{{$contact_actions.archive.title|escape}}">{{$contact_actions.archive.label|escape}}</a></li>{{/if}}
							{{if $contact_actions.delete.url}}<li role="presentation"><button role="menuitem" type="button" class="btn-link" title="{{$contact_actions.delete.title|escape}}" onclick="addToModal('{{$contact_actions.delete.url}}?confirm=1');">{{$contact_actions.delete.label|escape}}</button></li>{{/if}}
						</ul>
					</li>
				</ul>
				<div class="clear"></div>


				<div id="contact-edit-status-wrapper">
					<span id="contact-edit-contact-status">{{$contact_status|escape}}</span>

					{{* Block with status information about the contact *}}
					<ul>
						{{if $relation_text}}<li><div id="contact-edit-rel">{{$relation_text|escape}}</div></li>{{/if}}
						{{if $nettype}}<li><div id="contact-edit-nettype">{{$nettype|escape}}</div></li>{{/if}}

						{{if $poll_enabled}}
							<li><div id="contact-edit-last-update-text">{{$lastupdtext|escape}} <span id="contact-edit-last-updated">{{$last_update|escape}}</span></div>
							{{if $poll_interval}}
								<form id="contact-edit-poll-form" action="/contact/{{$contact_id}}" method="post"> 
									<span id="contact-edit-poll-text">{{$updpub|escape}}</span> {{$poll_interval}}
									<input class="btn btn-primary" type="submit" name="submit" value="{{$submit|escape:'html'}}" />
								</form>
							{{/if}}
							</li>
						{{/if}}

						{{if $lost_contact}}<li><div id="lost-contact-message">{{$lost_contact|escape}}</div></li>{{/if}}
						{{if $insecure}}<li><div id="insecure-message">{{$insecure|escape}}</div></li>	{{/if}}
						{{if $blocked && !$pending}}<li><div id="block-message">{{$blocked|escape}}</div></li>{{/if}}
						{{if $pending}}<li><div id="pending-message">{{$pending|escape}}</div></li>{{/if}}
						{{if $ignored}}<li><div id="ignore-message">{{$ignored|escape}}</div></li>{{/if}}
						{{if $archived}}<li><div id="archive-message">{{$archived|escape}}</div></li>{{/if}}
					</ul>

					<ul>
						<!-- <li><a href="network/?cid={{$contact_id}}" id="contact-edit-view-recent">{{$lblrecent|escape}}</a></li> -->
						{{if $follow}}<li><div id="contact-edit-follow"><a href="{{$follow}}">{{$follow_text|escape}}</a></div></li>{{/if}}
					</ul>
				</div> {{* End of contact-edit-status-wrapper *}}

				<div id="contact-edit-links-end"></div>

				<div class="panel-group" id="contact-edit-tools" role="tablist" aria-multiselectable="true">

					{{* Some information about the contact from the profile *}}
					<div class="panel">
						<div class="section-subtitle-wrapper" role="tab" id="contact-edit-profile">
							<h4>
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#contact-edit-tools" href="#contact-edit-profile-collapse" aria-expanded="true" aria-controls="contact-edit-profile-collapse">
									{{$contact_profile_label}}
								</a>
							</h4>
						</div>
						<div id="contact-edit-profile-collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="contact-edit-profile">
							<div class="section-content-tools-wrapper">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-muted">{{$profileurllabel|escape}}</div><a target="blank" href="{{$url}}">{{$profileurl|escape}}</a>
								</div>

								{{if $location}}
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<hr class="profile-separator">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-muted">{{$location_label|escape}}</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">{{$location|escape}}</div>
								</div>
								{{/if}}

								{{if $xmpp}}
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<hr class="profile-separator">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-muted">{{$xmpp_label|escape}}</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">{{$xmpp|escape}}</div>
								</div>
								{{/if}}

								{{if $keywords}}
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<hr class="profile-separator">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-muted">{{$keywords_label|escape}}</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">{{$keywords|escape}}</div>
								</div>
								{{/if}}

								{{if $about}}
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<hr class="profile-separator">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-muted">{{$about_label|escape}}</div>
									<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">{{$about|escape}}</div>
								</div>
								{{/if}}
							</div>
						</div>
						<div class="clear"></div>
					</div>

					{{if $contact_settings_label}}
					<div class="panel">
						<div class="section-subtitle-wrapper" role="tab" id="contact-edit-settings">
							<h4>
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#contact-edit-tools" href="#contact-edit-settings-collapse" aria-expanded="false" aria-controls="contact-edit-settings-collapse">
									{{$contact_settings_label|escape}}
								</a>
							</h4>
						</div>
						<div id="contact-edit-settings-collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="contact-edit-settings">
							<div class="section-content-tools-wrapper">

								<input type="hidden" name="contact_id" value="{{$contact_id|escape}}">

								{{include file="field_checkbox.tpl" field=$notify}}
								{{if $fetch_further_information}}
									{{include file="field_select.tpl" field=$fetch_further_information}}
									{{if $fetch_further_information.2 == 2 || $fetch_further_information.2 == 3}} {{include file="field_textarea.tpl" field=$ffi_keyword_blacklist}} {{/if}}
								{{/if}}
								{{include file="field_checkbox.tpl" field=$hidden}}

								<div class="form-group pull-right settings-submit-wrapper" >
									<button type="submit" name="submit" class="btn btn-primary" value="{{$submit|escape:'html'}}">{{$submit|escape}}</button>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
					{{/if}}

					{{if $lbl_info1}}
					<div class="panel">
						<div class="section-subtitle-wrapper" role="tab" id="contact-edit-info">
							<h4>
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#contact-edit-tools" href="#contact-edit-info-collapse" aria-expanded="false" aria-controls="contact-edit-info-collapse">
									{{$lbl_info1|escape}}
								</a>
							</h4>
						</div>
						<div id="contact-edit-info-collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="contact-edit-info">
							<div class="section-content-tools-wrapper">

								{{include file="field_textarea.tpl" field=$cinfo}}

								<div class="form-group pull-right settings-submit-wrapper" >
									<button type="submit" name="submit" class="btn btn-primary" value="{{$submit|escape:'html'}}">{{$submit|escape}}</button>
								</div>
								<div class="clear"></div>
								{{if $reason}}
								<h4>{{$lbl_info2|escape}}</h4>
								<p>{{$reason}}</p>
								<div class="clear"></div>
								{{/if}}
							</div>
						</div>
					</div>
					{{/if}}
					{{if $lbl_vis1}}
					<div class="panel">
						<div class="section-subtitle-wrapper" role="tab" id="contact-edit-profile-select">
							<h4>
								<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#contact-edit-tools" href="#contact-edit-profile-select-collapse" aria-expanded="false" aria-controls="contact-edit-profile-select-collapse">
									{{$lbl_vis1|escape}}
								</a>
							</h4>
						</div>
						<div id="contact-edit-profile-select-collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="contact-edit-profile-select">
							<div class="section-content-tools-wrapper">
								{{if $profile_select}}
									<div id="contact-edit-profile-select-text">
										<p>{{$lbl_vis2|escape}}</p>
									</div>
									<div class="form-group">
									{{$profile_select}}
									</div>
									<div class="clear"></div>
								{{/if}}

								<div class="form-group pull-right settings-submit-wrapper" >
									<button type="submit" name="submit" class="btn btn-primary" value="{{$submit|escape:'html'}}">{{$submit|escape}}</button>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</div>
					{{/if}}
				</div>

			</form>{{* End of the form *}}
		</div>{{* End of contact-edit-content-wrapper *}}
	</div>
</div>
