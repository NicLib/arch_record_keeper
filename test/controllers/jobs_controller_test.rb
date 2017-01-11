require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_job_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { au_chog: @job.au_chog, city: @job.city, complete: @job.complete, email: @job.email, name: @job.name, notes: @job.notes, person_type: @job.person_type, research_use: @job.research_use, state: @job.state, street_address: @job.street_address, subject: @job.subject, telephone: @job.telephone, time_spend: @job.time_spend, zip: @job.zip } }
    end

    assert_redirected_to job_url(Job.last)
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { au_chog: @job.au_chog, city: @job.city, complete: @job.complete, email: @job.email, name: @job.name, notes: @job.notes, person_type: @job.person_type, research_use: @job.research_use, state: @job.state, street_address: @job.street_address, subject: @job.subject, telephone: @job.telephone, time_spend: @job.time_spend, zip: @job.zip } }
    assert_redirected_to job_url(@job)
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end

    assert_redirected_to jobs_url
  end
end
