# Apache NiFi

### Info:

This template deploys a collection of monitoring services based upon the technologies listed below, once deployed you should have a monitoring platform capable of querying a wide variety of metrics that represent your environment, also included are somehandy pre-configured dashboards to get you started.

In this catalog item, the following technologies are utilised to make this as useful as possible;

* [Apache NiFi 1.5.0](https://nifi.apache.org/) - Description.


The full compliment of metrics from the Rancher server itsself are now available for graphing directly in Prometheus, this is easily enabled with an environment variable. For those interested, I've documented the steps [here].(https://github.com/infinityworksltd/Guide_Rancher_Monitoring)

All components in this stack are open source tools available in the community. All this template does is to bound them together in an easy to use package. I expect most people who find this useful will make use of this as a starting point and develop it further around their own needs.
 
## Deployment:
1. Select QiOn Cloud NiFi from the catalog.
2. Enter the URL Address of your Nifi server (used for accessing NiFi)
3. Click deploy.

## Usage
* NiFi will now be available on, running on port 8080/nifi.