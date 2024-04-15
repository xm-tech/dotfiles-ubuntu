# ==================
# functions
# ==================
function kubelog(){
	if [ $# -ge 3 ]; then
		# $1:namespace, $2:podname, $3:linenum
		kubectl logs -n $1 $2 --tail $3 -f
		return
	fi
	## $1:podname, $2:linenum
	kubectl logs $1 --tail $2 -f
}

function kubeps(){
    if [ $# -gt 0 ]; then
	# $1: namespace
    	kubectl get pods -n $1 # -o wide
	return
    fi
    kubectl get pods # -o wide
}

function kubelogin(){
    if [ $# -gt 1 ]; then
	kubectl exec -n $1 -it $2 /bin/bash
	return
    fi
    pod_name=$1
    kubectl exec -it $pod_name /bin/bash
}

function kubedel(){
    if [ $# -gt 1 ]; then
	    kubectl delete pods -n $1 $2 &
	    return
    fi
    pod_name=$1
    kubectl delete pods $pod_name &
}

function kubestop(){
    if [ $# -gt 1 ]; then
	    kubectl scale --replicas=0 deploy $1 -n $2
	    return
    fi
    pod_name=$1
    kubectl scale --replicas=0 deploy $pod_name
}

function p16(){
    print $(printf %x $1 | sed 's/%//g')
}

## 推送新配置到远端
function gps(){
    branch_name=$1
    git push --set-upstream origin $branch_name
}

function gt(){
    tag=$1
    comment=$2
    git tag -a ${tag} -m ${comment} && git push origin ${tag}
}

function gts(){
    tag = $1
    git show ${tag}
}

## revert git version to the special commit which would lost all commit after the ojbect commit
function grevert(){
    commitid=$1
    git reset --hard ${commitid}
    # git push -f
}

## k8s: proxy of kubectl get svc
function kubesvc(){
    if [ $# -gt 0  ]; then
	kubectl get svc -n $1
   	return
    fi
    # else
    kubectl get svc
}

## 统计 git 代码贡献
function gcs(){
	git log | ag Author | awk '{a[$2]+=1}END{for (name in a) {print name, a[name]}}' | sort -nr -k 2
}

# Create a new directory
function md() {
	mkdir -p "$@"
}

# caculate the size of a file or total size of a directory
function fsize() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

function flushdns() {
	sudo killall -HUP mDNSResponder
}
